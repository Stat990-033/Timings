using DataFrames,JSON

function timingtab(fin)
    js = JSON.parsefile(fin)
    println("Dataset: ",js["dsname"]," with ",js["n"]," observations")
    println("     OS: ",js["OS"])
    println("    CPU: ",js["CPU"]," with ",js["CPU_CORES"]," cores")
    println("   BLAS: ",js["BLAS"])
    println()
    for m in js["models"]
        println(" model: ",m["formula"])
        println(" p=",m["p"],", q=",m["q"],", nopt=",m["nopt"])
        println("plstype: ",m["mtype"])
        println()
        opts = ASCIIString[]
        elapsed = Float64[]
        deviance = Float64[]
        for f in m["fits"]
            push!(opts,string(lpad(f["func"],5),":",
                              rpad(f["optimizer"] == "nloptwrap" ?
                                   f["algorithm"] : f["optimizer"],30)))
            push!(elapsed, f["time"])
            push!(deviance,f["deviance"])
        end
        for i in sortperm(deviance)
            @printf("%s%12.3f, %8.3f",opts[i],deviance[i],elapsed[i])
            println()
        end
    end
end

function modelsummary(m)
    opt = ASCIIString[]
    times = Float64[]
    devs = Float64[]
    for f in m["fits"]
        push!(opt,f["optimizer"])
        push!(times,f["time"])
        push!(devs,f["dev"])
    end
    opt,times,devs,devs .- minimum(devs),fill(m["formula"],length(opt)),
       fill(m["p"],length(opt)),fill(m["q"],length(opt)),fill(m["nopt"],length(opt))
end

function optdir(dnm)
    dsnames = ASCIIString[]
    models = ASCIIString[]
    opts = ASCIIString[]
    times = Float64[]
    devs = Float64[]
    excessdev = Float64[]
    n = Int[]
    p = Int[]
    q = Vector{Int}[]
    np = Int[]
    for nm in readdir(dnm)
        js = JSON.parsefile(joinpath(dnm,nm))
        dsn = js["dsname"]
        for m in js["models"]
            opt,tt,dev,edevs,forms,pp,qq,nnpp = modelsummary(m)
            append!(models,forms)
            append!(opts,opt)
            append!(devs,dev)
            append!(excessdev,edevs)
            append!(times,tt)
            append!(p,pp)
            append!(q,qq)
            append!(np,nnpp)
            append!(dsnames,fill(dsn,length(opt)))
            append!(n, fill(js["n"],length(opt)))
        end
    end
    ret = DataFrame(opt=pool(opts),dsname=pool(dsnames),n=n,p=p,q=q,np=np,excess=DataArray(excessdev),
                    times=DataArray(times),devs=DataArray(devs),models=pool(models))
    ret[sortperm(ret[:opt]),:]
end

#cd("/home/bates/git/Timings/inst/JSON")

#opts = optimizers("Alfalfa.json")

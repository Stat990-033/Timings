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
            push!(opts,string(lpad(f["function"],5),":",
                              rpad(f["optimizer"] == "nloptwrap" ?
                                   f["algorithm"] : f["optimizer"],30)))
            push!(elapsed,
                  f["function"] == "lmer" ? f["time"][3] : f["time"])
            push!(deviance,f["deviance"])
        end
        for i in sortperm(deviance)
            @printf("%s%12.3f, %8.3f",opts[i],deviance[i],elapsed[i])
            println()
        end
    end
end

function optname(f)
    opt = f["optimizer"]
    opt == "nloptwrap" && return f["algorithm"]
    opt == "optimx" && return string(opt,":",f["method"])
    opt
end

function modelsummary(m)
    opt = ASCIIString[]
    times = Float64[]
    devs = Float64[]
    for f in filter(f->f["func"]=="lmer",m["fits"])
        push!(opt,optname(f))
        push!(times,f["time"])
        push!(devs,f["dev"])
    end
    opt,times,devs,devs .- minimum(devs),fill(m["formula"],length(opt))
end

function optdir(dnm)
    dsnames = ASCIIString[]
    models = ASCIIString[]
    opts = ASCIIString[]
    times = Float64[]
    devs = Float64[]
    excessdev = Float64[]
    for nm in readdir(dnm)
        js = JSON.parsefile(joinpath(dnm,nm))
        dsn = js["dsname"]
        for m in js["models"]
            opt,tt,dev,edevs,forms = modelsummary(m)
            append!(models,forms)
            append!(opts,opt)
            append!(devs,dev)
            append!(excessdev,edevs)
            append!(times,tt)
            append!(dsnames,fill(dsn,length(opt)))
        end
    end
    ret = DataFrame(opt=pool(opts),dsname=pool(dsnames),excess=DataArray(excessdev),
                    times=DataArray(times),devs=DataArray(devs),models=pool(models))
    ret[sortperm(ret[:opt]),:]
end

#cd("/home/bates/git/Timings/inst/JSON")

#opts = optimizers("Alfalfa.json")

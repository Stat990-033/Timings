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
js = JSON.parsefile("/home/bates/git/Timings/inst/JSON/Alfalfa.json")

function optimizers(fin)
      js = JSON.parsefile(fin)
    dsnames = ASCIIString[]
    models = ASCIIString[]
    opts = ASCIIString[]
    times = Float64[]
    devs = Float64[]
    dsn = js["dsname"]
    for m in js["models"]
        form = m["formula"]
        for f in m["fits"]
      @show f["func"]
            if f["func"] == "lmer"
              push!(dsnames,dsn)
              push!(models,form)
              push!(opts,f["optimizer"])
              push!(times,f["time"])
              push!(devs,f["dev"])
      end
    end
  end
  DataFrame(Any[pool(dsnames),pool(models),pool(opts),DataArray(times),DataArray(devs)],Symbol[:dsname,:model,:opt,:time,:dev])
end

cd("/home/bates/git/Timings/inst/JSON")

opts = optimizers("Alfalfa.json")
using DataArrays
pool(opts["dsnames"])
DataArray(opts["devs"])

methods(DataFrame)

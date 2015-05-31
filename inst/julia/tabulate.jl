using JSON,Showoff

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

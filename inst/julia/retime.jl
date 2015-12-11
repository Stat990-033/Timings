using DataFrames,JSON,MixedModels,RCall

@rimport Timings

function retime(fnm,ofile)
    js = JSON.parsefile(fnm)
    dsname = js["dsname"]
    @show dsname
    dat = rcopy(symbol(dsname))
    js["n"] = size(dat,1)
    js["CPU"] = Sys.cpu_info()[1].model
    js["CPU_CORES"] = CPU_CORES
    js["OS"] = Sys.OS_NAME
    js["Julia"] = string(VERSION)
    js["WORD_SIZE"] = Sys.WORD_SIZE
    js["BLAS"] = Base.blas_vendor()
    js["memory"] = string(@sprintf("%.3f ",Sys.total_memory()/2^30),"GB")
    for m in js["models"]
        form = eval(parse(m["formula"]))
        @show form
        mod = lmm(form,dat)
        nopt = length(mod[:θ])
        m["nopt"] = nopt
        println("-2log(likelihood) time(s) feval optimizer")
        for f in m["fits"]
            if f["func"] == "lmm"
                gc()
                f["time"] = @elapsed mod = fit!(lmm(form,dat),false,symbol(f["optimizer"]))
                f["dev"] = objective(mod)
                f["feval"] = mod.opt.feval
                m["p"] = size(mod.trms[end],2) - 1
            end
            @printf("%14.4f %10.4f%s %s",f["dev"],f["time"],
                    lpad(string(f["feval"]),6),f["optimizer"])
            println()
        end
    end
    open(isdir(ofile) ? joinpath(ofile,basename(fnm)) : ofile,"w") do io
        write(io,json(js,2))
    end
end

retime(fnm) = retime(fnm,fnm)

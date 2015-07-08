using DataFrames,JSON,MixedModels,RCall

function retime(fnm,ofile)
    js = JSON.parsefile(fnm)
    dsname = js["dsname"]
    @show dsname
    dat = DataFrame(string("Timings::",dsname))
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
        m["nopt"] = length(MixedModels.θ(mod))
        m["mtype"] = typeof(mod.s)
        for f in m["fits"]
            print(f["func"],": ",f["optimizer"])
            if f["func"] == "lmm"
                gc()
                f["time"] = @elapsed mod = fit(lmm(form,dat),false,symbol(f["optimizer"]))
                f["dev"] = deviance(mod)
                print(" ",mod.opt.fmin,", ",f["time"])
                f["feval"] = mod.opt.feval
                f["geval"] = mod.opt.geval
                m["p"] = size(mod.X,2)
                m["q"] = Int[length(b) for b in mod.b]
            else
                print(" ",f["dev"],", ",f["time"])
            end
            println()
        end
    end
    open(ofile,"w") do io
        write(io,json(js,2))
    end
end

retime(fnm) = retime(fnm,fnm)

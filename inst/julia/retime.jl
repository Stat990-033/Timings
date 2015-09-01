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
        nopt = length(MixedModels.θ(mod))
        mtype = typeof(mod.s)
        @show(nopt,mtype)
        m["mtype"] = mtype
        m["nopt"] = nopt
        println("-2log(likelihood) time(s) feval geval optimizer") 
        for f in m["fits"]
            if f["func"] == "lmm"
                gc()
                f["time"] = @elapsed mod = fit(lmm(form,dat),false,symbol(f["optimizer"]))
                f["dev"] = deviance(mod)
                f["feval"] = mod.opt.feval
                f["geval"] = mod.opt.geval
                m["p"] = size(mod.X,2)
                m["q"] = Int[length(b) for b in mod.b]
            end
            geval = get(f,"geval",0)
            @printf("%14.4f %10.4f%s%6d %s",f["dev"],f["time"],
                    lpad(string(f["feval"]),6),geval,f["optimizer"])
            println()
        end
    end
    open(isdir(ofile) ? joinpath(ofile,basename(fnm)) : ofile,"w") do io
        write(io,json(js,2))
    end
end

retime(fnm) = retime(fnm,fnm)

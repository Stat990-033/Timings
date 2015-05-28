using DataFrames,JSON,MixedModels,RCall

function retime(fnm)
    js = JSON.parsefile(fnm)
    dsname = js["dsname"]
    dat = DataFrame(string("Timings::",dsname))
    js["n"] = size(dat,1)
    for m in js["models"]
        form = eval(parse(m["formula"]))
        for f in m["fits"]
            f["function"] == "lmm" || next
            mod = fit(lmm(form,dat),false,symbol(f["optimizer"]))
            f["deviance"] = mod.opt.fmin
            f["feval"] = mod.opt.feval
            f["geval"] = mod.opt.geval
            gc()
            f["time"] = @elapsed(fit(lmm(form,dat)))
            m["p"] = size(mod.X,2)
            m["q"] = Int[length(b) for b in mod.b]
        end
    end
    json(js,2)
end

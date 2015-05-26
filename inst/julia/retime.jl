using DataFrames,JSON,MixedModels,RCall

function retime(fnm;repeet::Bool=false)
    js = JSON.parsefile(fnm)
    for k in keys(js)
        println(k)
        dat = DataFrame(k)
        for mm in js[k]
            ff = mm["formula"]
            println(ff)
            form = eval(parse(ff))
            if (repeet || !haskey(mm,"lmm"))
                println("lmm")
                lm = lmm(form,dat)
                fm = fit(lmm(form,dat))
                gc()
                tt = @elapsed(fit(lmm(form,dat)))
                mm["lmm"] = [:deviance=>deviance(fm),
                             :theta=>MixedModels.θ(fm),
                             :hasgrad=>hasgrad(fm),
                             :time=>tt]
                if (hasgrad(fm))
                    println("lmmng")
                    fm = fit(lmm(form,dat),false,false)
                    gc()
                    tt = @elapsed(fit(lmm(form,dat),false,false))
                    mm["lmmng"] = [:deviance=>deviance(fm),
                                   :theta=>MixedModels.θ(fm),
                                   :time=>tt]
                end
            end
        end
    end
    json(js,2)
end

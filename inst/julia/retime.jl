using DataFrames,JSON,MixedModels,RCall

function retime(fnm)
    js = JSON.parsefile(fnm)
    for k in keys(js)
        println(k)
        dat = DataFrame(k)
        for mm in js[k]
            form = eval(parse(mm["formula"]))
            if !haskey(mm,"lmm")
                fm = fit(lmm(form,dat))
                gc()
                tt = @elapsed(fit(lmm(form,dat)))
                mm["lmm"] = [:deviance=>deviance(fm),
                             :theta=>MixedModels.θ(fm),
                             :hasgrad=>hasgrad(fm),
                             :time=>tt]
            end
        end
    end
    json(js,2)
end

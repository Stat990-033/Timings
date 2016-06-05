using Compat, DataFrames, DataStructures, JSON, MixedModels, RCall

R" suppressPackageStartupMessages(library(Timings)) "
@rimport Timings

const desc = OrderedDict(
    :Jvers => string(VERSION, " (", Base.GIT_VERSION_INFO.date_string, ")"),
    :Rvers => rcopy(reval(:version)[symbol("version.string")]),
    :CPU => Sys.cpu_info()[1].model,
    :OS => string(Sys.KERNEL),
    :CPU_CORES => length(Sys.cpu_info()),
    :WORD_SIZE => Sys.WORD_SIZE,
    :BLAS => BLAS.vendor(),
    :memory => string(@sprintf("%.3f ",Sys.total_memory()/2^30),"GB"))

function retime(fnm)
    js = JSON.parsefile(fnm)
    dsname = symbol(js["dsname"])
    @show dsname
    dat = rcopy(dsname)
    dd = OrderedDict{Compat.String, Any}("n" => size(dat, 1))
    for m in js["models"]
        fstr = m["formula"]
        form = eval(parse(fstr))
        @show form
        model = fit!(lmm(form, dat))
        fits = OrderedDict(:nopt => length(model[:θ]),
            :p => length(fixef(model)),
            :q => map(length, ranef(model, true))
            )
        for opt in (:LN_BOBYQA, :LN_BOBYQA, :LN_COBYLA, :LN_NELDERMEAD, :LN_SBPLX)
            gc()
            tm = @elapsed mod = fit!(lmm(form, dat), false, opt)
            fits[opt] = OrderedDict(:objective => objective(mod),
                :time => tm, :neval => mod.opt.feval)
        end
        dd[fstr] = fits
    end
    desc[dsname] = dd
end

using Compat, DataFrames, DataStructures, JSON, MixedModels, RCall

R" suppressPackageStartupMessages(library(Timings)) "
@rimport Timings

const OS = string(VERSION ≤ v"0.4.6" ? Sys.OS_NAME : Sys.KERNEL)
const desc = OrderedDict(
    :Jvers => string(VERSION, " (", Base.GIT_VERSION_INFO.date_string, ")"),
    :Rvers => rcopy(reval(:version)[Symbol("version.string")]),
    :CPU => Sys.cpu_info()[1].model,
    :OS => OS,
    :CPU_CORES => length(Sys.cpu_info()),
    :WORD_SIZE => Sys.WORD_SIZE,
#    :BLAS => BLAS.vendor(),
    :BLAS => Base.libblas_name,
    :memory => string(@sprintf("%.3f ",Sys.total_memory()/2^30),"GB"))

function retime(fnm)
    js = JSON.parsefile(fnm)
    dsname =  Symbol(js["dsname"])
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

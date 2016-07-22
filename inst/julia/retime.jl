using Compat, DataFrames, DataStructures, JSON, MixedModels, RCall

R" suppressPackageStartupMessages(library(Timings)) "

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
    for (ds, dict) in JSON.parsefile(fnm, dicttype = OrderedDict)
        dat = rcopy(Symbol(ds))
        dd = OrderedDict{Compat.String, Any}("n" => size(dat, 1))
        for (form, optimizers) in dict
            fform = eval(parse(form))
            model = fit!(lmm(fform, dat))
            fits = OrderedDict(:nopt => length(model[:θ]),
                :p => length(fixef(model)),
                :q => map(length, ranef(model, true))
                )
            for joptimizer in filter(r"^LN_", optimizers)  # optimize with lmm in Julia
                gc()
                optsym = Symbol(joptimizer)
                tm = @elapsed model = fit!(lmm(fform, dat), false, optsym)
                fits[optsym] = Float64[objective(model), tm, model.opt.feval]
            end
            R"form <- eval(parse(text = $form))"
            R"ds <- eval(as.symbol($ds))"
            if "bobyqa" ∈ optimizers
                fits[:bobyqa] = rcopy(R"""
                    tt <- system.time(mm <- lmer(form, ds, REML = FALSE,
                        control = lmerControl(optimizer = "bobyqa", calc.derivs = FALSE,
                            optCtrl = list(maxfun = 100000))))
                    c(deviance(mm), round(tt[3], 3), mm@optinfo$feval)
                """)
            end
            if "Nelder_Mead" ∈ optimizers
                fits[:Nelder_Mead] = rcopy(R"""
                    tt <- system.time(mm <- lmer(form, ds, REML = FALSE,
                        control = lmerControl(optimizer = "Nelder_Mead", calc.derivs = FALSE,
                            optCtrl = list(maxfun = 100000))))
                    c(deviance(mm), round(tt[3], 3), mm@optinfo$feval)
                """)
            end
            for nloptalg in filter(r"^NLOPT_LN_", optimizers)
                fits[Symbol(nloptalg)] = rcopy(R"""
                    tt <- system.time(mm <- lmer(form, ds, REML = FALSE,
                        control = lmerControl(optimizer = "nloptwrap", calc.derivs = FALSE,
                            optCtrl = list(algorithm = $nloptalg, maxeval = 100000))))
                    c(deviance(mm), round(tt[3], 3), mm@optinfo$feval)
                """)
            end
            for optimxalg in filter(r"^optimx:", optimizers)
                RCall.globalEnv[:method] = RCall.sexp(convert(ASCIIString, split(optimxalg, ':')[2]))
                fits[Symbol(optimxalg)] = rcopy(R"""
                    tt <- system.time(mm <- lmer(form, ds, REML = FALSE,
                        control = lmerControl(optimizer = "optimx", calc.derivs = FALSE,
                            optCtrl = list(method = method, maxit = 100000))))
                    c(deviance(mm), round(tt[3], 3), mm@optinfo$feval)
                """)
            end
            dd[form] = fits
        end
        desc[Symbol(ds)] = dd
    end
end

#' Retime a model fit
#'
#' \code{retime} adds a new timing to a list, usually created from a JSON file,
#' by refitting the model.
#'
#' @param fin name of the input JSON file
#' @param fout name of the output JSON file, default is the same name as the input.
#' @return the same list augmented with a new timing
#' @export
retime <- function(fin,fout=fin) {
    stopifnot(is.list(js <- fromJSON(fin,FALSE)),
              is.data.frame(dat <- eval(as.symbol(js$dsname))),
              is.list(mods <- js$models))
    print(js$dsname)
    for (i in seq_along(mods)) {
        m <- mods[[i]]
        form <- eval(parse(text=m$formula))

        for (j in seq_along(m$fits)) {
            algorithm <- "NA"
            method <- "NA"
            f <- m$fits[[j]]
            if (f[["func"]] != "lmer")
                next
            opt <- f$optimizer
            if (length(sp1 <- strsplit(opt,':')[[1]]) == 2L) {
                opt <- sp1[1]
                method <- sp1[2]
            }
            if (regexpr("^NLOPT_LN_",opt) == 1L) {
                algorithm <- opt
                opt <- "nloptwrap"
            }
            optCtrl <- switch(opt,
                              bobyqa = list(maxfun=100000),
                              Nelder_Mead = list(maxfun=100000),
                              nloptwrap = list(algorithm=algorithm, maxeval=100000),
                              optimx = list(method=method))
            ctrl <- lmerControl(optimizer=opt,optCtrl=optCtrl,calc.derivs=FALSE)
            tt <- system.time(ff <- lmer(form,dat,REML=FALSE,control=ctrl))
            f$time <- unclass(tt)[3]
            f$dev <- deviance(ff)
            f$feval <- ff@optinfo$feval
            js$models[[i]][["fits"]][[j]] <- f
            print(paste(opt,f$time,f$feval,f$dev))
        }
    }
    js$Rversion <- R.Version()$version.string
    cat(toJSON(js,digits=I(16),auto_unbox=TRUE,pretty=2),file=fout)
}

nlminbw <- lme4:::nlminbwrap

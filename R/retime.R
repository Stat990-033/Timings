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
    for (i in seq_along(mods)) {
        m <- mods[[i]]
        form <- eval(parse(text=m$formula))
        for (j in seq_along(m$fits)) {
            f <- m$fits[[j]]
            if (f[["function"]] != "lmer")
                next
            opt <- f$optimizer
            optCtrl <- switch(opt,
                              bobyqa = list(maxfun=1e10),
                              Nelder_Mead = list(maxfun=1e10),
                              nloptwrap = list(algorithm=f$algorithm, maxeval=1e10),
                              optimx = list(method=f$method))
            ctrl <- lmerControl(optimizer=f$optimizer,optCtrl=optCtrl)
            tt <- system.time(ff <- lmer(form,dat,REML=FALSE,control=ctrl))
            f$time <- unclass(tt)[1:3]
            f$deviance <- deviance(ff)
            f$feval <- ff@optinfo$feval
            js$models[[i]][["fits"]][[j]] <- f
        }
    }
    cat(toJSON(js,digits=I(16),auto_unbox=TRUE,pretty=2),file=fout)
}

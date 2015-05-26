#' Retime a model fit
#' 
#' \code{retime} adds a new timing to a list, usually created from a JSON file,
#' by refitting the model.
#' 
#' @param fnm name of a json file
#' @return the same list augmented with a new timing
#' @export
retime <- function(fnm, redo=FALSE, ...) {
    lst <- fromJSON(fnm,FALSE)
    stopifnot(is.list(lst))
    dsnms <- names(lst)
    for (dsnm in dsnms) {
        dat <- eval(parse(text=dsnm))
        mods <- lst[[dsnm]]
        for (i in seq_along(mods)) {
            mm <- mods[[i]]
            stopifnot(is.character(form <- mm$formula))
            if (redo || !("lmer" %in% names(mm))) {
                tt <- system.time(ff <- lmer(formula(form),dat,REML=FALSE))
                lst[[dsnm]][[i]]$lmer <- 
                    list(deviance=deviance(ff),
                         theta=getME(ff,"theta"),
                         time=unclass(tt)[1:3],
                         feval=ff@optinfo$feval)
            }
        }
    }
    toJSON(lst,digits=I(16),auto_unbox=TRUE,pretty=2)
}

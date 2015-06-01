revisefr <- function(f) {
    names(f)[names(f)=="deviance"] <- "dev"
    f$dev <- round(f$dev,2)
    names(f)[names(f)=="function"] <- "fun"
    f$optimizer <- ifelse(is.na(f$algorithm),f$optimizer,f$algorithm)
    f$optimizer <- ifelse(is.na(f$method), f$optimizer, paste(f$optimizer,f$method,sep=':'))
    f <- subset(f,select=-c(algorithm,method,geval))
    f$time <- sapply(f$time,function(v)v[length(v)])
    f[order(f$dev,f$time),]
}

#' Extract information on the model fits from a JSON package as data frames
#'
#' @param fin name of the input JSON file
#' @return a list of data frames.  Each frame is ordered by deviance (rounded to 2 decimal places)
#'    and by elapsed time withing deviance.
#' @export
extractor <- function(fin) lapply(fromJSON(fin)$models$fits,revisefr)

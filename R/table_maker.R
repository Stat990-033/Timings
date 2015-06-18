files <- list.files(system.file("JSON",package="Timings"))
OPTS<-c("NLOPT_LN_BOBYQA" ,    "NLOPT_LN_SBPLX"  ,    "NLOPT_LN_COBYLA"  ,   "optimx:spg"         
        ,"optimx:L-BFGS-B"   ,  "optimx:nlminb"    ,   "NLOPT_LN_NELDERMEAD" ,"NLOPT_LN_PRAXIS"    
        ,"bobyqa"   ,   "optimx:bobyqa" , "Nelder_Mead")
#for (i in OPTS[-8]){
    table.maker<-function(fn){
        js <- fromJSON(fn,FALSE)     
        tester<-data.frame(extractor(fn)[1])  # edited to add [1]
        tester<-subset(tester,func=="lmer")
        abs.dev<- tester$dev[tester$optimizer==i]-sort(unique(tester$dev))[1] 
        abs.time<-tester$time[tester$optimizer==i]-sort(unique(tester$time))[1]
        data.name.char<-js$dsname
        model.fit.char<-js$models[[1]]$formula
        num.re<-js$models[[1]]$q
        num.fe<-js$models[[1]]$p
        table<-data.frame(data.name.char,model.fit.char,abs.dev,abs.time,num.fe)
        colnames(table)<-c("Data","Model","Deviance","Time","FE")
        return(table)
    }
#     for (j in files[-39]){
#         table3=rbind(table3,table.maker(j))
#         save(table3,file=fileName)  # makes right files, with bad data call (table3)
#     }
#     
# }
optnm <- function(f) {
    opt <- f$optimizer
    if (opt %in% c("bobyqa","Nelder_Mead")) return(opt)
    if (opt == "nloptwrap") return(f$algorithm)
    if (opt == "optimx") return(paste("optimx_",f$method,sep=''))
    stop(paste("unknown optimizer:", opt))
}

lmerfits <- function(fits) {
    ans <- fits[sapply(fits,function(f)f$func == "lmer")]
    names(ans) <- sapply(ans,optnm)
    ans
}

#' From a directory name extract all the timings from the JSON files
#' 
#' @description Given a directory name read all the files in the directory
#'   with names ending in .json.  Returns a list of lists.  The names of
#'   the list.
#' @param dname name of a firectory
#' @return a list of data sets, models within dataset, and fits within models
#' @export
jsondir <- function(dname) {
    ans <- lapply(list.files(dname,pattern="*.json$",full.names=TRUE),fromJSON,simplifyVector=FALSE)
    names(ans) <- sapply(ans,function(tab)tab$dsname)
    ans    
}

ropts <- function(fits) {
    lst <- lapply(fits,optnm)
    lst[is.character(lst)]
}

islmer <- function(fit) fit$func == "lmer"
lmeronly <- function(mod) {
    f <- mod$fits
    mod$fits <- f[sapply(f,islmer)]
    mod
}

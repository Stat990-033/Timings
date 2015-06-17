


table3=NULL
for (i in OPTS[-8]){
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
    for (j in files[-39]){
        table3=rbind(table3,table.maker(j))
        save(table3,file=fileName)  # makes right files, with bad data call (table3)
    }
    
}





corr <- function(directory, threshold = 0) {
    directory <- "C:\\Users\\Mak\\Documents\\specdata"
    setwd(directory)
    files<-dir()
    res <- vector("numeric")
    data<-data.frame()
    #Read all CSV files in directory
    id = 1:332
    for(i in id)
    {
        temp <- read.csv(files[i])
        cases <- complete.cases(temp)
        temp1 <- temp[cases,]
        if(nrow(temp1) > threshold){
            t1 <- temp1[,2]
            t2 <- temp1[,3]
            res <- append(res, cor(t1,t2))   
        }
    }    
    setwd("C:\\Users\\Mak\\Documents")
    res
}
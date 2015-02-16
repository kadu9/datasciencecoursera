complete <- function(directory, id = 1:332) {
    directory <- "C:\\Users\\Mak\\Documents\\specdata"
    setwd(directory)
    files<-dir()
    data<-data.frame()
    #Read all CSV files in directory
    for(i in id)
    {
        temp <- read.csv(files[i])
        cases <- complete.cases(temp)
        temp1 <- temp[cases,]
        row <- c(i,nrow(temp1))
        data <- rbind(data,row)
    }
    setwd("C:\\Users\\Mak\\Documents")
    names(data) <-c ("id", "nobs")
    data
}
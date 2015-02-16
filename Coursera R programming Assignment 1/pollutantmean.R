pollutantmean <- function(directory, pollutant, id = 1:332) { 
    directory <- "C:\\Users\\Mak\\Documents\\specdata"
    setwd(directory)
    #Read all CSV files in directory
    csvFiles <- dir()
    # create data frame
    dFrame <- data.frame()
    for(i in id) {
        dFrame <- rbind(dFrame, read.csv(csvFiles[i]))
    }
    
    meanPollutant <- mean(dFrame[,pollutant], na.rm = TRUE)
    # reset back the working direcotry
     setwd("C:\\Users\\Mak\\Documents")
    #Round off the value
    meanPollutant <- round(meanPollutant, 3)
    meanPollutant
}

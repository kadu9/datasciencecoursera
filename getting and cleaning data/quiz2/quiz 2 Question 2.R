library(sqldf)

acs <- read.csv("acs.csv", header = TRUE)

sqldf("select pwgtp1 from acs where AGEP < 50")
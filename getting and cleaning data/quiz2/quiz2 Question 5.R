data <- read.fwf("getdata-wksst8110.for",widths=c(-1,9,-5,4,4,-5,4,4,-5,4,4,-5,4,4), skip=4)
head(data)
sum(data[,4])
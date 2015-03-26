
# @author : Mayur k
# @email : mayurkadu9@gmail.com
# The American Community Survey distributes downloadable data about United States communities. Download the 2006 microdata survey about housing for the state of Idaho using download.file() from here: 
#   
#   https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv 
# 
# and load the data into R. The code book, describing the variable names is here: 
#   
#   https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf 
# 
# Create a logical vector that identifies the households on greater than 10 acres who sold more than $10,000 worth of agriculture products. Assign that logical vector to the variable agricultureLogical. Apply the which() function like this to identify the rows of the data frame where the logical vector is TRUE. which(agricultureLogical) What are the first 3 values that result?
library(jpeg)
# Question 1

furl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
fdes <- "ACS.csv"
download.file(furl,fdes)
ACS <- read.csv("ACS.csv")

ACS$logicVector <- ifelse(ACS$AGS ==6 & ACS$ACR ==3, TRUE, FALSE)
which(ACS$logicVector)



# Question 2
furl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
fdest <- "jeff.jpg"
download.file(furl,fdes)
pic <- readJPEG('jeff.jpg', native=FALSE)
quantile(pic, probs = c(0.3,0.8))

# Question 3

urlData1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
data1 <- "GDP.csv"

urlData2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
data2 <- "GDP2.csv"

download.file(urlData1,data1)
download.file(urlData2,data2)

d1 <- read.csv("GDP.csv", header = FALSE, skip =10)
d2 <- read.csv("GDP2.csv", header = FALSE)

d3 <- merge(d1,d2, by.x = 'V1', by.y = 'V1', sort = TRUE)
d3[with(d3, order(-V2) )]



#@author : Mayur k
#@email  : mayurkadu9@gmail.com
features <- read.table("features.txt",header = FALSE)
activityType <- read.table("activity_labels.txt", header = FALSE)
subjectTrain <- read.table("train/subject_train.txt",header=FALSE); 
xTrain       = read.table("train/x_train.txt",header=FALSE); 
yTrain       = read.table("train/y_train.txt",header=FALSE); 

# Assigin column names to the data above
colnames(activityType)  = c('activityId','actType');
colnames(subjectTrain)  = "subjectId";
colnames(xTrain)        = features[,2]; 
colnames(yTrain)        = "activityId";

# cCreate the final training set by merging yTrain, subjectTrain, and xTrain
trainingData = cbind(yTrain,subjectTrain,xTrain);

# Read test data
subjectTest = read.table("test/subject_test.txt",header=FALSE); 
xTest       = read.table("test/x_test.txt",header=FALSE); 
yTest       = read.table("test/y_test.txt",header=FALSE); 

# Assign column names to the test data
colnames(subjectTest) = "subjectId";
colnames(xTest)       = features[,2]; 
colnames(yTest)       = "activityId";


# Create the final test set by merging the xTest, yTest and subjectTest data
testData = cbind(yTest,subjectTest,xTest);
#Merge training and test dataset
finalData = rbind(trainingData,testData);

colNames  = colnames(finalData); 
logicalVector = (grepl("activity..",colNames) | grepl("subject..",colNames) | 
                     grepl("-mean..",colNames) & !grepl("-meanFreq..",colNames) & 
                     !grepl("mean..-",colNames) | grepl("-std..",colNames) & 
                     !grepl("-std()..-",colNames));

finalData = finalData[logicalVector==TRUE];

# Use descriptive activity names to name the activities in the data set
finalData = merge(finalData,activityType,by='activityId',all.x=TRUE);
colNames  = colnames(finalData); 
# Reassigning the new descriptive column names to the finalData set
for (i in 1:length(colNames)) 
{
    colNames[i] = gsub("\\()","",colNames[i])
    colNames[i] = gsub("-std$","StdDev",colNames[i])
    colNames[i] = gsub("-mean","Mean",colNames[i])
    colNames[i] = gsub("^(t)","time",colNames[i])
    colNames[i] = gsub("^(f)","freq",colNames[i])
    colNames[i] = gsub("([Gg]ravity)","Gravity",colNames[i])
    colNames[i] = gsub("([Bb]ody[Bb]ody|[Bb]ody)","Body",colNames[i])
    colNames[i] = gsub("[Gg]yro","Gyro",colNames[i])
    colNames[i] = gsub("AccMag","AccMagnitude",colNames[i])
    colNames[i] = gsub("([Bb]odyaccjerkmag)","BodyAccJerkMagnitude",colNames[i])
    colNames[i] = gsub("JerkMag","JerkMagnitude",colNames[i])
    colNames[i] = gsub("GyroMag","GyroMagnitude",colNames[i])
};

# Reassigning the new descriptive column names to the finalData set
colnames(finalData) = colNames;
# Create a second, independent tidy data set with the average of each variable for each activity and each subject. 

finalData = finalData[,names(finalData) != 'activityType'];

# Summarizing the finalData table to include just the mean of each variable for each activity and each subject
tidyData    = aggregate(finalData[,names(finalData) != c('activityId','subjectId')],by=list(activityId=finalDataNoActivityType$activityId,subjectId = finalDataNoActivityType$subjectId),mean);

# Merging the tidyData with activityType to include descriptive acitvity names
tidyData    = merge(tidyData,activityType,by='activityId',all.x=TRUE);
#write tidy data to text file
write.table(tidyData, './tidyData.txt',row.names=FALSE,sep='\t');
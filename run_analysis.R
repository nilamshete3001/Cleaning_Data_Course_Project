##################### Getting and Cleaning Data Course Project #####################

## Setting working directory
setwd("E:/Nilam/Coursera/CleaningData/Course_Project/UCI HAR Dataset/")

## Reading training data and checking dimensions
trainData <- read.table("./train/X_train.txt")
dim(trainData)
head(trainData)

## Reading training activity labels data and checking dimensions 
trainLabels <- read.table("./train/y_train.txt")
table(trainLabels)
dim(trainLabels)

## Reading training subject data and checking dimensions
trainSubject <- read.table("./train/subject_train.txt")
table(trainSubject )
dim(trainSubject )

## Importing column names for data and checking dimesions 
colNames <- read.table("./features.txt")
dim(colNames)
names(colNames)

## Reading testing data and checking dimensions
testData <- read.table("./test/X_test.txt")
str(testData)
dim(testData)
names(testData)

## Reading testing activity labels data and checking dimensions
testLabels <- read.table("./test/y_test.txt")
table(testLabels)
dim(testLabels)

## Reading testing subject data and checking dimensions
testSubject <- read.table("./test/subject_test.txt")
table(testSubject)
dim(testSubject)


############### Step 1 #################

## Merge traning data, activity data and subject data into one and check dimensions
finalTrainData <- cbind(trainSubject, trainLabels,trainData)
dim(finalTrainData)
head(finalTrainData)

## Merge testing data, activity data and subject data into one and check dimensions
finalTestData <- cbind(testSubject, testLabels,testData)
dim(finalTestData)

## Merging training and testing data and checking dimesions
mergedData <- rbind(finalTrainData, finalTestData)
dim(mergedData)

## Changing column names of merged data
colnames(mergedData) <- c("subject","Activity",as.vector(colNames$V2))


############### Step 2 #################

## Selecting only variables realted to mean() and std() with subject, activity variables
toMatch <- c("mean()","std()")
colNeeded <- grep(paste(toMatch,collapse="|"),colnames(mergedData), value=TRUE)
finalCols <- colNeeded[!grepl("meanFreq()", colNeeded)]

finalData <- mergedData[,c("subject","Activity",finalCols)] 
dim(finalData)
names(finalData)


############### Step 3 #################

## Changing activities to descriptive labels in merged data
finalData$Activity <- as.character(finalData$Activity)
finalData$Activity[which(finalData$Activity == "1")] = "WALKING"
finalData$Activity[which(finalData$Activity == "2")] = "WALKING_UPSTAIRS"
finalData$Activity[which(finalData$Activity == "3")] = "WALKING_DOWNSTAIRS"
finalData$Activity[which(finalData$Activity == "4")] = "SITTING"
finalData$Activity[which(finalData$Activity == "5")] = "STANDING"
finalData$Activity[which(finalData$Activity == "6")] = "LAYING"


############### Step 4 #################

## Renaming variables by assigning descriptive variable names
colnames(finalData) <- c("subject", "Activity", "timeBodyAccMeanX", "timeBodyAccMeanY",          
"timeBodyAccMeanZ", "timeBodyAccStdX", "timeBodyAccStdY",
"timeBodyAccStdZ", "timeGravityAccMeanX", "timeGravityAccMeanY",
"timeGravityAccMeanZ", "timeGravityAccStdX", "timeGravityAccStdY",
"timeGravityAccStdZ", "timeBodyAccJerkMeanX", "timeBodyAccJerkMeanY",     
"timeBodyAccJerkMeanZ", "timeBodyAccJerkStdX", "timeBodyAccJerkStdY", 
"timeBodyAccJerkStdZ", "timeBodyGyroscopeMeanX", "timeBodyGyroscopeMeanY",         
"timeBodyGyroscopeMeanZ", "timeBodyGyroscopeStdX", "timeBodyGyroscopeStdY", 
"timeBodyGyroscopeStdZ", "timeBodyGyroscopeJerkMeanX", "timeBodyGyroscopeJerkMeanY",     
"timeBodyGyroscopeJerkMeanZ", "timeBodyGyroscopeJerkStdX", "timeBodyGyroscopeJerkStdY", 
"timeBodyGyroscopeJerkStdZ", "timeBodyAccMagMean", "timeBodyAccMagStd", 
"timeGravityAccMagMean", "timeGravityAccMagStd", "timeBodyAccJerkMagMean", 
"timeBodyAccJerkMagStd", "timeBodyGyroscopeMagMean", "timeBodyGyroscopeMagStd",
"timeBodyGyroscopeJerkMagMean", "timeBodyGyroscopeJerkMagStd", "fftBodyAccMeanX",
"fftBodyAccMeanY", "fftBodyAccMeanZ", "fftBodyAccStdX",
"fftBodyAccStdY", "fftBodyAccStdZ", "fftBodyAccJerkMeanX",
"fftBodyAccJerkMeanY", "fftBodyAccJerkMeanZ", "fftBodyAccJerkStdX", 
"fftBodyAccJerkStdY", "fftBodyAccJerkStdZ", "fftBodyGyroscopeMeanX", 
"fftBodyGyroscopeMeanY", "fftBodyGyroscopeMeanZ", "fftBodyGyroscopeStdX", 
"fftBodyGyroscopeStdY", "fftBodyGyroscopeStdZ", "fftBodyAccMagMean", 
"fftBodyAccMagStd", "fftBodyAccJerkMagMean", "fftBodyAccJerkMagStd", 
"fftBodyGyroscopeMagMean", "fftBodyGyroscopeMagStd", 
"fftBodyGyroscopeJerkMagMean", "fftBodyGyroscopeJerkMagStd")


############### Step 5 #################

## Summarize each variable to mean to get final tidy data
library(dplyr)

finalData_dt <- tbl_df(finalData)
tidyData <- summarise_each(group_by(finalData_dt,subject, Activity), 
		funs(mean))

## Export the result in text file
write.table(tidyData , "./tidyData.txt",row.name=FALSE)
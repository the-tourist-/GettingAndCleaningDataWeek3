library(XML)

## Read in files
activityLabelsRaw <- read.delim("UCI HAR Dataset/activity_labels.txt", header=F, sep=" ")
featuresRaw <- read.delim("UCI HAR Dataset/features.txt", header=F, sep=" ")
subjectTrain <- read.delim("UCI HAR Dataset/train/subject_train.txt", header=F, sep=" ")
trainX <- read.delim("UCI HAR Dataset/train/X_train.txt", header=F, sep="", blank.lines.skip=T)
trainY <- read.delim("UCI HAR Dataset/train/y_train.txt", header=F, sep=" ")
subjectTest <- read.delim("UCI HAR Dataset/test/subject_test.txt", header=F, sep=" ")
testX <- read.delim("UCI HAR Dataset/test/X_test.txt", header=F, sep="", blank.lines.skip=T)
testY <- read.delim("UCI HAR Dataset/test/y_test.txt", header=F, sep=" ")

## Convert features and activity labels to vectors, processes the feature names to conform to R standards
features <- gsub(",", ".", gsub("-", ".", sub(")", "", sub("(", ".", sub("()", "", featuresRaw$V2, fixed=T), fixed=T), fixed=T)))
activityLabels <- as.character(activityLabelsRaw$V2)

## Set the names of the features
colnames(trainX) = features
colnames(testX) = features

## Restrict the features to only those that have Std or Mean in their name
meanStdFeatures <- union(grep("Mean", features, ignore.case=T), grep("Std", features, ignore.case=T))

## Merge the files, converting the activity identifier into a factor using the activity labels as names.  
## A new column trainingSet is also created with TRUE for rows from the training set 
## and FALSE for rows from the test set
fullDataSet <- rbind(
  cbind(subject=subjectTrain, trainingSet=T, trainX[,meanStdFeatures], activity=lapply(trainY, function(index) { activityLabels[index] })),
  cbind(subject=subjectTest, trainingSet=F, testX[,meanStdFeatures], activity=lapply(testY, function(index) { activityLabels[index] }))
)





library(XML)

## Read in files
#activityLabelsRaw <- read.delim("UCI HAR Dataset/activity_labels.txt", header=F, sep=" ")
#featuresRaw <- read.delim("UCI HAR Dataset/features.txt", header=F, sep=" ")
subjectTrain <- read.delim("UCI HAR Dataset/train/subject_train.txt", header=F, sep=" ")
#trainX <- read.delim("UCI HAR Dataset/train/X_train.txt", header=F, sep=" ")
#trainY <- read.delim("UCI HAR Dataset/train/y_train.txt", header=F, sep=" ")
subjectTest <- read.delim("UCI HAR Dataset/test/subject_test.txt", header=F, sep=" ")
#testX <- read.delim("UCI HAR Dataset/test/X_test.txt", header=F, sep=" ")
#testY <- read.delim("UCI HAR Dataset/test/y_test.txt", header=F, sep=" ")

## Convert features and activity labels to vectors, remove brackets from feature names
#features <- sub("-", ".", sub(")", "", sub("(", ".", sub("()", "", featuresRaw$V2, fixed=T), fixed=T), fixed=T))
#activityLabels <- as.character(activityLabelsRaw$V2)

## Set the names of the features
colnames(trainX) = features
colnames(testX) = features

## Merge the files, converting the activity identifier into a factor using the activity labels as names.  
## A new column trainingSet is also created with TRUE for rows from the training set 
## and FALSE for rows from the test set

fullDataSet <- rbind(
  cbind(subjectTrain, trainingSet=T, trainX, lapply(trainY, function(index) { activityLabels[index] })),
  cbind(subjectTest, trainingSet=F, testX, lapply(testY, function(index) { activityLabels[index] }))
)
  


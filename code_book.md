#Getting And Cleaning Data 
##Week 3 Project 

The data files were downloaded into the ./UCI HAR Dataset directory

All data files were loaded into local data frames

The features data frame, which lists the names of features measured was processed as follows :
*Occurances of "()" were removed
*Occurances of "(" (single opening brackets) were replaced by "."
*Occurances of ")" (single closing brackets) were removed
*Occurances of "-" and "," were replaced by "."
These manipulations were made in order to ensure the names comformed to R naming standards

The "features" processed above were used as the column names in the TestX and TrainX data frames.

The 6 downloaded tables were stitched together to create a single dataframe.  This data frame had the following structure :
*subject : from the subject_train and subject_test files (subjectTrain and subjectTest data frames)
*trainingset : this was set to TRUE for rows from the training files and FALSE for rows from the test files
*features 1..561 : the TestX and TrainX data frames were then appended, adding 561 columns, named according to the processed feature names above
*activity : this was created as a 6 level factor, with the factor names coming from the activity_labels file (activityLabels data frame)
The rows from the test data frames were appended to the rows from the train data frames, with the trainingset field separating them



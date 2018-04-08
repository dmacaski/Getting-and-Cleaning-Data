# Getting-and-Cleaning-Data
used for the Data Science Coursera course

The 'run_analysis.R' script imports data collected from the accelerometers of a Samsung Galaxy S smartphone.  A full description
is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here is the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The script then performs the following functions:

  -  Merges the training and the test data sets to create one data set
  -  Extracts only the MEAN and STD measurements for each measurement contained in the source data
  -  Assigns descriptive activity names to the activities in the data set
  -  Labels the data set with descriptive variable names for the collected data
  -  Uses the merged TEST and TRAIN data set to create a second, independent "tidy" data set with
     the average of each variable for each activity and each subject (using the melt and cast functions)

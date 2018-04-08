## download the data
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/uci.zip")
unzip("./data/uci.zip")

##  collect the date of the downloaded data
dateDownloaded <- date()
dateDownloaded

## read the downloaded TRAIN data and create a data frame
## contains the 561 collected TRAIN values
train_x<-read.table("./UCI HAR Dataset/train/X_train.txt")
train_y<-read.table("./UCI HAR Dataset/train/Y_train.txt")
train_subj<-read.table("./UCI HAR Dataset/train/subject_train.txt")

## read the downloaded TEST data and create a data frame
## contains the 561 collected TEST values
test_x<-read.table("./UCI HAR Dataset/test/X_test.txt")
test_y<-read.table("./UCI HAR Dataset/test/Y_test.txt")
test_subj<-read.table("./UCI HAR Dataset/test/subject_test.txt")

## read the downloaded FEATURES data and create a data frame
## contains the labels for the 561 test that were collected
features<-read.table("./UCI HAR Dataset/features.txt")

## explore the TRAIN data frame
head(train_x,2)
head(train_y,2)
head(train_subj,2)

## explore the TEST data frame
head(test_x,2)
head(test_y,2)
head(test_subj,2)

## rename the column name for the data frames that contains the ACTIVITY labels
colnames(train_y)<-"activity"
colnames(test_y)<-"activity"

## rename the column name for the data frames that contains the SUBJECT numbers
colnames(train_subj)<-"subject"
colnames(test_subj)<-"subject"

## rename the column name for the data frame that contains the COLLECTED DATA labels
colnames(features)<-c("feature_number","feature_description")

## use the feature_description column to rename the TRAIN and TEST data frame 
## COLLECTED DATA column labels
colnames(train_x)<-features$feature_description
colnames(test_x)<-features$feature_description

## decode the TRAIN data frame ACTIVITY values and change them to the descriptive character values
train_y$activity <- factor(train_y$activity,
                    levels = c(1,2,3,4,5,6),
                    labels = c("Walking", "Walking_Upstairs", "Walking_Downstairs", "Sitting","Standing", "Laying"))

## decode the TEST data frame ACTIVITY values and change them to the descriptive character values
test_y$activity <- factor(test_y$activity,
                           levels = c(1,2,3,4,5,6),
                           labels = c("Walking", "Walking_Upstairs", "Walking_Downstairs", "Sitting", "Standing", "Laying"))

## filter the features for only STD or MEAN collected values
extract_features <- grepl("mean|std", features[,2])

## apply the STD or MEAN filter to the TRAIN and TEST collected data (train_x and test_x)
train_x<- train_x[,extract_features]
test_x<- test_x[,extract_features]

##  merge the TRAIN collected data (train_x) with the TRAIN activity data (train_y)
train_merge<-cbind(train_y,train_x)
##  merge the MERGED TRAIN collected data (train_merge) with the TRAIN subject data (train_subj)
train_merge2<-cbind(train_subj,train_merge)

##  merge the TEST collected data (test_x) with the TEST activity data (test_y)
test_merge<-cbind(test_y,test_x)
##  merge the MERGED TEST collected data (test_merge) with the TEST subject data (test_subj)
test_merge2<-cbind(test_subj,test_merge)

## Merge test and train data
all_data = rbind(train_merge2, test_merge2)

## reshape the data into a VERTICAL dataset
library(reshape)
id_labels   = c("subject", "activity")
data_labels = setdiff(colnames(all_data), id_labels)
melted_data  = melt(all_data, id = id_labels, measure.vars = data_labels)

# Apply mean function to dataset using dcast function to create a 'tidy' dataset
my_tidy_data   = cast(melted_data, subject + activity ~ variable, mean)

write.table(my_tidy_data, row.name=FALSE,file = "./my_tidy_data.txt")


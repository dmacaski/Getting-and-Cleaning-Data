The 'run_analysis.R' script downloads, creates, and transforms several data sets in order to create one final 'tidy' dataset.  
The script contains comments to document each step taken during this process.  The following describes the name of each 
dataset created and its purpose for each data set created by the script.

##  First Step --> Download the source data
The zip file 'uci.zip' is downloaded to the following subdirectory of the working directory:  "./data/uci.zip" and then
is unzipped to the working directory.  The date of the download is captured in the 'dateDownloaded' character variable.

##  Second Step -->  create data frames/data sets from the downloaded source data
The following data sets are created from the source data:

train_x         contains collected data for use in the training dataset
train_y         contains the labels for each activity per test conducted for use in the training dataset 
train_subj      contains the subject ID for each test conducted for use in the training dataset
test_x          contains collected data for use in the test dataset
test_y          contains the labels for each activity per test conducted for use in the test dataset 
test_subj       contains the subject ID for each test conducted for use in the test dataset
features        contains the labels for each test conducted (561 tests in total)

##  Third Step -->  each data set created above is explored to better understand the structure

##  Fourth Step -->  the activity and subject column names are transformed from their default values to 'activity' and 'subject'.  The 
##  feature ID and feature description columns in the features dataset are renamed to 'feature_number' and 'feature_description'.

##  Fifth Step -->  the labels used for each test conducted (516) is changed to match the 'feature_description' column from the 
##  features data set

## Sixth Step  -->  each activity code is transformed to a more descriptive label as follows:
  
  1-->"Walking"
  2-->"Walking_Upstairs"
  3-->"Walking_Downstairs"
  4-->"Sitting"
  5-->"Standing"
  6-->"Laying"
  
## Seventh Step  -->  




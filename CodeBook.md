The 'run_analysis.R' script downloads, creates, and transforms several data sets in order to create one final 'tidy' dataset.  
The script contains comments to document each step taken during this process.  The following describes the name of each 
dataset created and its purpose for each data set created by the script.

#  First Step --> Download the source data
The zip file 'uci.zip' is downloaded to the following subdirectory of the working directory:  "./data/uci.zip" and then
is unzipped to the working directory.  The date of the download is captured in the 'dateDownloaded' character variable.

#  Second Step -->  create data frames/data sets from the downloaded source data
The following data sets are created from the source data:

train_x         contains collected data for use in the training dataset

train_y         contains the labels for each activity per test conducted for use in the training dataset 

train_subj      contains the subject ID for each test conducted for use in the training dataset

test_x          contains collected data for use in the test dataset

test_y          contains the labels for each activity per test conducted for use in the test dataset 

test_subj       contains the subject ID for each test conducted for use in the test dataset

features        contains the labels for each test conducted (561 tests in total)


#  Third Step -->  each data set created above is explored to better understand the structure

#  Fourth Step -->  the activity and subject column names are transformed from their default values to 'activity' and 'subject'.  The feature ID and feature description columns in the features dataset are renamed to 'feature_number' and 'feature_description'.

#  Fifth Step -->  the labels used for each test conducted (516) is changed to match the 'feature_description' column from the features data set

# Sixth Step  -->  each activity code is transformed to a more descriptive label as follows:
  
  1-->"Walking"
  
  2-->"Walking_Upstairs"
  
  3-->"Walking_Downstairs"
  
  4-->"Sitting"
  
  5-->"Standing"
  
  6-->"Laying"
  
# Seventh Step  -->  the train and test data sets are filtered to ONLY contain STD or MEAN tests

This reduces the train_x and test_x datasets to 79 columns from 561

#  Eigth Step  -->  merge the train_x (collected data) with the train_y (activity) data and then merge the train_subj (subject ID) data with the previously merged train data set

#  Ninth Step -->  repeat step #8 above, but for the test data sets

# Tenth Step -->  merge the train and test data sets into one data set (all_data)

# Eleventh Step -->  reshape the all_data data set with the 'reshape' library in order to 'melt' it into a vertical data set.  The resulting data set is 'melted_data'

#  Twelevth Step -->  use the 'cast' function to create a 'tidy' data set from the 'melted_data'.  Cast the new data set based on the activity mean per subject.  The resulting data set is 'my_tidy_data'.

#  Thirteenth Step -->  write out the 'tidy' data set as 'my_tidy_data.txt' file.









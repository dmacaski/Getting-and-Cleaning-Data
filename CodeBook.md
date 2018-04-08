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

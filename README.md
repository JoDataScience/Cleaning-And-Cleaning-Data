# Working principles of run_analysis.R 

## General Notes

The R script run_analysis.R is meant to clean data collected from the accelerometers from the Samsung Galaxy S smartphone.
The dataset, and detailed information about it are available at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones .
Here is a direct link for the download: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


## Prerequisites: 
The script requires that a directory named "UCI HAR Dataset" is in the working directory from which the script is launched. This directory must contain the data collected from the Samsung smartphone. That is actually the name of the directory once the archive downloaded with the link above is unzipped. If you still have not downloaded the data, you can uncomment the first lines of the script in order to let it do the job for you. <br/><br/> *Note:* The script will install the package 'dplyr' and load it for you since it requires this package to work. 

## Step 1: Merge the training and the test sets to create one data set. 

The script makes use of the **read.table()** function (with default options) to read the training and testing data and to load it inside R dataframes. Hence, X_train.txt, y_train.txt, subject_train.txt and their homologous *test* files are loaded into R as dataframe objects. Then these dataframes are joined together (two by two) using the rbind() function with the default parameters. The resulting dataframes are named x_df, y_df and subject_df.

## Step 2: Extract only the measurements on the mean and standard deviation for each measurement.
First, the names of the features are retrieved from the features.txt file, which is loaded into R with the **read.table()** function. Then the names of the features of interest (that is those regarding the mean and the standard deviation are retrieved using the **grepl** function. Finally, the columns of the x_df dataframe are selected according to these names with the help of the **select** function from the **dplyr** package. 

## Step 3: Use descriptive activity names to name the activities in the data set.
The labels of the activities are retrieved from the acitivity_labels.txt file using the **read_table()** function. Then, thanks to the use of the **rename** and **mutate** functions of the **dplyr** package, the values of the labels have been transformed into the 6 factors (WALKING, WALKING UPSTAIRS, WALKING DOWNSTAIRS, SITTING, STANDING, LYING). 

## Step 4: Appropriately label the data set with descriptive variable names.
The feature name of the variables corresponding to means and standard deviations are used to rename the columns of x_df, the subject_df single column is renamed with the variable name "subject". Note that the variable name of y_df was already renamed in step n°3. Finally the 3 dataframs y_df, subject_df and x_df are column bind to create a clean and tidy dataset. 

## Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
The functions **group_by** and **summarize_all** have bean used to directly fullfil this step. Finally, the **Tidy_Dataset** is written into a .txt file using the **write.table()** function with the parameter **row.names** set to **FALSE**.
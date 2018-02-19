install.packages(dplyr)
library(dplyr)

# 0. Getting the Data
# Downloading the file.
#download.file(url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = "DataSet.zip", mode = "wb")
#zipF <- "DataSet.zip"
#outDir <- getwd()
#unzip(zipF, exdir = outDir)
setwd(dir = "./UCI HAR Dataset/")

# 1. Merge the training and the test sets to create one data set.

# Reading both datasets into dataframes:
x_train_df <- read.table("./train/X_train.txt")
y_train_df <- read.table("./train/y_train.txt")
subject_train_df <- read.table("./train/subject_train.txt")

x_test_df <- read.table("./test/X_test.txt")
y_test_df <- read.table("./test/y_test.txt")
subject_test_df <- read.table("./test/subject_test.txt")

# Joining training and testing datasets
x_df <- rbind(x_train_df, x_test_df)
y_df <- rbind(y_train_df, y_test_df)
subject_df <- rbind(subject_train_df, subject_test_df)



# 2.Extract only the measurements on the mean and standard deviation for each measurement.
# Getting the name of each features from features.txt
features_names <- read.table("features.txt", col.names = c("feature_number", "feature_name"))
mean_std_cols <- features_names[grepl("mean()", features_names$feature_name, fixed = TRUE) | grepl("std()", features_names$feature_name, fixed=TRUE),]
x_df <- x_df %>% 
  select(as.vector(mean_std_cols$feature_number))


# 3. Use descriptive activity names to name the activities in the data set
# Loading activity labels:
activity_lab <- read.table("./activity_labels.txt")

y_df <- y_df %>% 
              rename(activity = V1) %>%
              mutate(activity = factor(x = y_df$V1, labels = activity_lab$V2))


# 4. Appropriately label the data set with descriptive variable names.
colnames(x_df) <- as.vector(mean_std_cols$feature_name)
subject_df <- rename(subject_df, subject = V1)

# Merging the activity labels, the subjects and the measures together. 
dataset <- cbind(y_df, subject_df, x_df)

# 5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
final_dataset <- dataset %>% 
                    group_by(activity, subject) %>%
                    summarize_all(funs(mean))

write.table(final_dataset, file="../Tidy_DataSet.txt", row.names = FALSE)
final_dataset

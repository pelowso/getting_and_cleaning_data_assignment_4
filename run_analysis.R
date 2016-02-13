library(data.table)
library(dplyr)

# Download and extract dataset from URL
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if(!file.exists("assignment4")) {dir.create("assignment4")}
download.file(url, "./assignment4/assignment4.zip")
unzip("./assignment4/assignment4.zip", exdir = "./assignment4")

# Read features names that are common to training and test datasets
feature_names <- "./assignment4/UCI HAR Dataset/features.txt"
features <- fread(feature_names)

# Read activities labels that are common to training and test datasets
# And convert them to lowercase for clarity
activity_names <- "./assignment4/UCI HAR Dataset/activity_labels.txt"
activities <- fread(activity_names)
activities$V2 <- tolower(activities$V2)

# Create training dataset
# 1. Read data, activity and subject records
# 2. Set feature names to columns of data table
# 3. Set columns names to activity and subject tables
# 4. Remove duplicated columns from data table
# 5. Bind data, activity and subject tables by column
# 6. Add dataset information to dataset column
train_file <- "./assignment4/UCI HAR Dataset/train/X_train.txt"
train_act_file <- "./assignment4/UCI HAR Dataset/train/Y_train.txt"
train_subject_file <- "./assignment4/UCI HAR Dataset/train/subject_train.txt"
train <- fread(train_file)
train_activity <- fread(train_act_file)
train_subjects <- fread(train_subject_file)
setnames(train, features$V2)
setnames(train_activity, "V1", "activity")
setnames(train_subjects, "V1", "subject")
train <- train[,unique(names(train)),with=FALSE]
train <- cbind(train, train_activity,train_subjects)
train <- train[,dataset := "training"]

# Create test dataset
# 1. Read data, activity and subject records
# 2. Set feature names to columns of data table
# 3. Set columns names to activity and subject tables
# 4. Remove duplicated columns from data table
# 5. Bind data, activity and subject tables by column
# 6. Add dataset information to dataset column
test_file <- "./assignment4/UCI HAR Dataset/test/X_test.txt"
test_act_file <- "./assignment4/UCI HAR Dataset/test/Y_test.txt"
test_subject_file <- "./assignment4/UCI HAR Dataset/test/subject_test.txt"
test <- fread(test_file)
test_activity <- fread(test_act_file)
test_subjects <- fread(test_subject_file)
setnames(test, features$V2)
setnames(test_activity, "V1", "activity")
setnames(test_subjects, "V1", "subject")
test <- test[,unique(names(test)),with=FALSE]
test <- cbind(test, test_activity,test_subjects)
test <- test[,dataset := "test"]

# 1. Create merged table from training and test by binding rows
# 2. Select informational columns and all data columns with mean and sd values
# 3. Replace activity codes with descriptive names
tidy <- rbind(train, test)
tidy <- tidy %>% select(dataset, subject, activity, 
                        contains("mean()"), contains("std()")) %>%
        mutate(activity = activities$V2[activity])

# 4. Replace column names with proper and descriptive variables names
proper_column_names <- names(tidy)
proper_column_names <- gsub("\\(\\)", "", proper_column_names)
proper_column_names <- gsub("-", "_", proper_column_names) 
tidy <- tidy %>% setnames(proper_column_names)
        
# 5. Create another dataet with the average of each variable 
#    for each activity and each subject (for both training and testing)
tidy_summ <- tidy %>% group_by(subject, activity) %>%
        summarize_each(funs(mean), -dataset) %>%
        arrange(desc(subject))
write.table(tidy_summ, "./assignment4/tidy_summary.txt", row.names = FALSE)
print(tidy_summ)







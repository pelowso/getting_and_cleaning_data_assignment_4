# PROCESSING A DATA SET FOR LATER ANALYSIS

## Files
* **README.md**: this file, which explains the purpose of the different files and how the script works
* **CodeBook.md**: Describes the data set, its variables and the data transformations applied to it
* **run_analysis.R**: The script that contains all the R code for downloading and processing the source data set to obtain the new one
* **tidy_summary.txt**: Output data set exported as a text table

## How the script works (run_analysis.R)
The script has some inside comments explaining how each part of the code works.  
This is a general description of what it does:

1. Download and extract source data set from URL
	* variables: *url*
2. Read features names that are common to training and test datasets
	* variables: *feature_names, features*
3. Read activities labels that are common to training and test datasets and convert them to lowercase for clarity
	* variables: *activity_names, activities*
4. Create training dataset
	+ Read data, activity and subject records
	+ Set feature names to columns of data table
	+ Set columns names to activity and subject tables
	+ Remove duplicated columns from data table
	+ Bind data, activity and subject tables by column
	+ Add dataset information to dataset column
	* variables: *train_file, train_act_file, train_subject_file, train, train_activity, train_subjects, features*
5. Create test dataset
	+ Read data, activity and subject records
	+ Set feature names to columns of data table
	+ Set columns names to activity and subject tables
	+ Remove duplicated columns from data table
	+ Bind data, activity and subject tables by column
	+ Add dataset information to dataset column
	* variables: *test_file, test_act_file, test_subject_file, test, test_activity, test_subjects*
6. Create merged table from training and test by binding rows
	* variables: *tidy, train, test*
7. Select informational columns and all data columns with mean and sd values
	* variables: *tidy*
8. Replace activity codes with descriptive names
	* variables: *tidy, activities*
9. Replace column names with proper and descriptive variables names
	* variables: *proper_column_names, tidy*
10. Create another dataset with the average of each variable for each activity and each subject (for both training and testing)
	* variables: *tidy, tidy_summ*




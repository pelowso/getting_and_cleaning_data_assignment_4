# MODIFIED DATA SET FOR FURTHER ANALYSIS

## Source Data set
Source dataset and the following explanation is obtained from:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

It contains measurements from some experiments in the context of a project called "Human Activity Recognition Using Smartphones". The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

Using the embedded accelerometer and gyroscope of the smartphone they captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

For each record it is provided:
* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment.

Further information about the variables (features) of this data set can be obtained from the project web page and the data set itself.

## Modified Data set 1 (tidy)
The data set provided here is a subset of the original. It joins the information from training and test data sets into one, indicating its source in a newly added column (dataset). It also joins information from the subject and activity (columns "subject" and "activity") that are related to each record, so all information is available in a single table (tidy). In the original data set the activities are coded using 6 numbers and their labels are provided in a different file. In the modified data set these numbers are replaced by their labels in lowercase. The original data set has some duplicated columns which are removed in the modified data set. The joined source data set has **10.299 rows and 480 columns** after adding the 3 new columns (*dataset, activity and subject*) and removing duplicates.  
Only the measurements on the mean (containing *mean()*) and standard deviation (containing *std()*) from the source data set are provided in the new one. Their names are also modified for clarity and standarization, removing all parentheses and hyphens.
Dimensions of the modified data set are **10.299. rows and 69 columns**.

### Variables included in the modified data set:

Newly added:
* *dataset*:
	+ *"training"*: records from training (train) dataset
	+ *"test"*: records from test (test) dataset
* *subject*: subject number for both training and test data sets (1:30)
* *activity*: activity label
	+ *"walking"*
	+ *"walking_upstairs"*
	+ *"walking_downstairs"*
	+ *"sitting"*
	+ *"standing"*
	+ *"laying"*

Measurements from the source data set:
* *tBodyAcc_mean_X*
* *tBodyAcc_mean_Y*
* *tBodyAcc_mean_Z*
* *tGravityAcc_mean_X*
* *tGravityAcc_mean_Y*
* *tGravityAcc_mean_Z*
* *tBodyAccJerk_mean_X*
* *tBodyAccJerk_mean_Y*
* *tBodyAccJerk_mean_Z*
* *tBodyGyro_mean_X*
* *tBodyGyro_mean_Y*
* *tBodyGyro_mean_Z*
* *tBodyGyroJerk_mean_X*
* *tBodyGyroJerk_mean_Y*
* *tBodyGyroJerk_mean_Z*
* *tBodyAccMag_mean*
* *tGravityAccMag_mean*
* *tBodyAccJerkMag_mean*
* *tBodyGyroMag_mean*
* *tBodyGyroJerkMag_mean*
* *fBodyAcc_mean_X*
* *fBodyAcc_mean_Y*
* *fBodyAcc_mean_Z*
* *fBodyAccJerk_mean_X*
* *fBodyAccJerk_mean_Y*
* *fBodyAccJerk_mean_Z*
* *fBodyGyro_mean_X*
* *fBodyGyro_mean_Y*
* *fBodyGyro_mean_Z*
* *fBodyAccMag_mean*
* *fBodyBodyAccJerkMag_mean*
* *fBodyBodyGyroMag_mean*
* *fBodyBodyGyroJerkMag_mean*
* *tBodyAcc_std_X*
* *tBodyAcc_std_Y*
* *tBodyAcc_std_Z*
* *tGravityAcc_std_X*
* *tGravityAcc_std_Y*
* *tGravityAcc_std_Z*
* *tBodyAccJerk_std_X*
* *tBodyAccJerk_std_Y*
* *tBodyAccJerk_std_Z*
* *tBodyGyro_std_X*
* *tBodyGyro_std_Y*
* *tBodyGyro_std_Z*
* *tBodyGyroJerk_std_X*
* *tBodyGyroJerk_std_Y*
* *tBodyGyroJerk_std_Z*
* *tBodyAccMag_std*
* *tGravityAccMag_std*
* *tBodyAccJerkMag_std*
* *tBodyGyroMag_std*
* *tBodyGyroJerkMag_std*
* *fBodyAcc_std_X*
* *fBodyAcc_std_Y*
* *fBodyAcc_std_Z*
* *fBodyAccJerk_std_X*
* *fBodyAccJerk_std_Y*
* *fBodyAccJerk_std_Z*
* *fBodyGyro_std_X*
* *fBodyGyro_std_Y*
* *fBodyGyro_std_Z*
* *fBodyAccMag_std*
* *fBodyBodyAccJerkMag_std*
* *fBodyBodyGyroMag_std*
* *fBodyBodyGyroJerkMag_std*

## Modified Data set 2 (tidy_summ)
Based on the new tidy data set, this one is a summary of it with the average of each variable for each activity and each subject (for both training and testing).
tidy data set is grouped by activity and subject and the mean() function is applied to every other column but dataset. It has the same variable names than the previous data set.  
Dimensions of this new data set (tidy_summ) are **180 rows (30 subjects x 6 activities) and 68 columns** (all columns from tidy dataset but "dataset").








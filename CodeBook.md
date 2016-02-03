## Human Activity Recognition Using Smartphones Dataset Analysis using run_analysis script  
This script is merging the records of a measurements taken from a group of 30 volunteers wearing Samsung Galasy S II on their waist
while performing six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).

The script merges txt files that was transfromed according to the test design detailed in:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The script outputs 2 datasets:
* **mergeddataset -** A subset of all the records where only the measurements on the mean and standard deviation for each measurement is present
* **meansummary -** A tidy data set with the average of each variable for each activity and each subject.

in order to make the dataset nice and tidy few transformations were done:
* The activity number was replaced by a dedescriptive activity names
* The dataset was grouped by subject number and by activity
* Only the measurements on the mean and standard deviation for each measurement were extracted

The variables of mergeddataset are:  
subject number  
activity  
tBodyAcc-XYZ  
tGravityAcc-XYZ  
tBodyAccJerk-XYZ  
tBodyGyro-XYZ  
tBodyGyroJerk-XYZ  
tBodyAccMag  
tGravityAccMag  
tBodyAccJerkMag  
tBodyGyroMag  
tBodyGyroJerkMag  
fBodyAcc-XYZ  
fBodyAccJerk-XYZ  
fBodyGyro-XYZ  
fBodyAccMag  
fBodyAccJerkMag  
fBodyGyroMag  
fBodyGyroJerkMag  

for each of the measurements (excluding the subject number and the activity) the mean and std values are present  
(all values are normalized and bounded within [-1,1])


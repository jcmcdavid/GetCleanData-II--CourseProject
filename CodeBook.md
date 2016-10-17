# CodeBook.MD file  
John C. McDavid, 10/16/2016  

Summary Analysis of Data recording Human Activity Using Smartphones Dataset (Version 1.0) - Code Book  

This is the CodeBook for the summary analysis performed on the data.  This will describe the variables, data, transformations and processing of the work done.  See also the README.md file for companion information.  

## Overview of data and data processing (and transformations). All was done in R code.  
See the README.md file for a description of the experiment.  
The datasets provided had separate training and test datasets. The training datasets had 7352 observations and the test datasets had 2947 observations. For each of the training and test datasets, there were 3 files: 1. a file containing 561 features (data measurement variables), 2. a file indicating subject number (30), and 3. a file indicating activity (6) for each observation.  
The six activities were walking, walking upstairs, walking downstairs, sitting, standing, laying.  
The training datasets were column combined; similarly for the test datasets.  
The training and test datasets were combined by rows into one master dataset.  
Only 79 certain features were selected for analysis.  These were the all the mean and standard deviation variables (33 each) and meanFreq variables (13). Other measurement variables that had mean in their name were not selected because those are different measurement variables (angle).  
The master dataset was reduced to the 79 features of interest (using the grep function).  
The master dataset was aggregated (using the "aggregate" command with function mean in R) to find the averages of all the observations of each feature (79) by subject (30) and activity (6) and reported as a tidy data set.  

The tidy data has Subject (30), Activity (6 for each subject), and average for each selected feature (for each of subject x activity).  

The tidy data set is Signals4.  

## Data - master data set ("master","master3")  
  Measurement units of data  
     "t" prefix indicates time domain signal at constant rate of 50 Hz  
     "f" prefix indicates frequency domain signals  
     >> the data are normalized from raw data and bounded by [-1,1] so the data in the datasets used for this analysis is dimensionless  
There are 81 columns:  "Subject ID", "Activity Label", and 79 feature variables.  
Subject ID - subject # (1-30)  
Activity Label - label of activity code performed (six identifiers, see text above)  
The 79 features are listed below.  The descriptions are coded by what the measurement is for.  I will describe how to decode the feature labels rather than repeating similar language for all 79.  
mean() - mean value of the signal  
std() - standard deviation of the signal  
meanFreq() - mean frequency of the signal  
Acc - accelerometer reading of signal  
Gyro - gyroscope reading of signal  
t - measurement in time domain  
f - frequency domain signals  
X, Y, Z - three linear vectors of space (axial signals)  
Mag - magnitude  
Jerk - derived in time from body linear acceleration and angular velocity (Jerk is rate of change in acceleration)  
Body - body movement  
Gravity - Gravity component  
Variable names (column labels) follow:  
"Subject ID"  
"Activity Label"  
"tBodyAcc-mean()-X"  
"tBodyAcc-mean()-Y"  
"tBodyAcc-mean()-Z"  
"tGravityAcc-mean()-X"  
"tGravityAcc-mean()-Y"  
"tGravityAcc-mean()-Z"  
"tBodyAccJerk-mean()-X"  
"tBodyAccJerk-mean()-Y"  
"tBodyAccJerk-mean()-Z"  
"tBodyGyro-mean()-X"  
"tBodyGyro-mean()-Y"  
"tBodyGyro-mean()-Z"  
"tBodyGyroJerk-mean()-X"  
"tBodyGyroJerk-mean()-Y"  
"tBodyGyroJerk-mean()-Z"  
"tBodyAccMag-mean()"  
"tGravityAccMag-mean()"  
"tBodyAccJerkMag-mean()"  
"tBodyGyroMag-mean()"  
"tBodyGyroJerkMag-mean()"  
"fBodyAcc-mean()-X"  
"fBodyAcc-mean()-Y"  
"fBodyAcc-mean()-Z"  
"fBodyAcc-meanFreq()-X"  
"fBodyAcc-meanFreq()-Y"  
"fBodyAcc-meanFreq()-Z"  
"fBodyAccJerk-mean()-X"  
"fBodyAccJerk-mean()-Y"  
"fBodyAccJerk-mean()-Z"  
"fBodyAccJerk-meanFreq()-X"  
"fBodyAccJerk-meanFreq()-Y"  
"fBodyAccJerk-meanFreq()-Z"  
"fBodyGyro-mean()-X"  
"fBodyGyro-mean()-Y"  
"fBodyGyro-mean()-Z"  
"fBodyGyro-meanFreq()-X"  
"fBodyGyro-meanFreq()-Y"  
"fBodyGyro-meanFreq()-Z"  
"fBodyAccMag-mean()"  
"fBodyAccMag-meanFreq()"  
"fBodyBodyAccJerkMag-mean()"  
"fBodyBodyAccJerkMag-meanFreq()"  
"fBodyBodyGyroMag-mean()"  
"fBodyBodyGyroMag-meanFreq()"  
"fBodyBodyGyroJerkMag-mean()"  
"fBodyBodyGyroJerkMag-meanFreq()"  
"tBodyAcc-std()-X"  
"tBodyAcc-std()-Y"  
"tBodyAcc-std()-Z"  
"tGravityAcc-std()-X"  
"tGravityAcc-std()-Y"  
"tGravityAcc-std()-Z"  
"tBodyAccJerk-std()-X"  
"tBodyAccJerk-std()-Y"  
"tBodyAccJerk-std()-Z"  
"tBodyGyro-std()-X"  
"tBodyGyro-std()-Y"  
"tBodyGyro-std()-Z"  
"tBodyGyroJerk-std()-X"  
"tBodyGyroJerk-std()-Y"  
"tBodyGyroJerk-std()-Z"  
"tBodyAccMag-std()"  
"tGravityAccMag-std()"  
"tBodyAccJerkMag-std()"  
"tBodyGyroMag-std()"  
"tBodyGyroJerkMag-std()"  
"fBodyAcc-std()-X"  
"fBodyAcc-std()-Y"  
"fBodyAcc-std()-Z"  
"fBodyAccJerk-std()-X"  
"fBodyAccJerk-std()-Y"  
"fBodyAccJerk-std()-Z"  
"fBodyGyro-std()-X"  
"fBodyGyro-std()-Y"  
"fBodyGyro-std()-Z"  
"fBodyAccMag-std()"  
"fBodyBodyAccJerkMag-std()"  
"fBodyBodyGyroMag-std()"  
"fBodyBodyGyroJerkMag-std()"  

## Data - tidy data set ("Signals4")  
Measurement units - see description above (same as for master datasets)  
See above also for description of how labels are derived  
The variables in this dataset are Averages of all observations for that subject #, activity description (label), and feature so those variable names are pre-pended by "Avg."  
Variable names (column labels) follow:  
"Subject ID"  
"Activity Label"  
"Avg.tBodyAcc-mean()-X"  
"Avg.tBodyAcc-mean()-Y"  
"Avg.tBodyAcc-mean()-Z"  
"Avg.tGravityAcc-mean()-X"  
"Avg.tGravityAcc-mean()-Y"  
"Avg.tGravityAcc-mean()-Z"  
"Avg.tBodyAccJerk-mean()-X"  
"Avg.tBodyAccJerk-mean()-Y"  
"Avg.tBodyAccJerk-mean()-Z"  
"Avg.tBodyGyro-mean()-X"  
"Avg.tBodyGyro-mean()-Y"  
"Avg.tBodyGyro-mean()-Z"  
"Avg.tBodyGyroJerk-mean()-X"  
"Avg.tBodyGyroJerk-mean()-Y"  
"Avg.tBodyGyroJerk-mean()-Z"  
"Avg.tBodyAccMag-mean()"  
"Avg.tGravityAccMag-mean()"  
"Avg.tBodyAccJerkMag-mean()"  
"Avg.tBodyGyroMag-mean()"  
"Avg.tBodyGyroJerkMag-mean()"  
"Avg.fBodyAcc-mean()-X"  
"Avg.fBodyAcc-mean()-Y"  
"Avg.fBodyAcc-mean()-Z"  
"Avg.fBodyAcc-meanFreq()-X"  
"Avg.fBodyAcc-meanFreq()-Y"  
"Avg.fBodyAcc-meanFreq()-Z"  
"Avg.fBodyAccJerk-mean()-X"  
"Avg.fBodyAccJerk-mean()-Y"  
"Avg.fBodyAccJerk-mean()-Z"  
"Avg.fBodyAccJerk-meanFreq()-X"  
"Avg.fBodyAccJerk-meanFreq()-Y"  
"Avg.fBodyAccJerk-meanFreq()-Z"  
"Avg.fBodyGyro-mean()-X"  
"Avg.fBodyGyro-mean()-Y"  
"Avg.fBodyGyro-mean()-Z"  
"Avg.fBodyGyro-meanFreq()-X"  
"Avg.fBodyGyro-meanFreq()-Y"  
"Avg.fBodyGyro-meanFreq()-Z"  
"Avg.fBodyAccMag-mean()"  
"Avg.fBodyAccMag-meanFreq()"  
"Avg.fBodyBodyAccJerkMag-mean()"  
"Avg.fBodyBodyAccJerkMag-meanFreq()"  
"Avg.fBodyBodyGyroMag-mean()"  
"Avg.fBodyBodyGyroMag-meanFreq()"  
"Avg.fBodyBodyGyroJerkMag-mean()"  
"Avg.fBodyBodyGyroJerkMag-meanFreq()"  
"Avg.tBodyAcc-std()-X"  
"Avg.tBodyAcc-std()-Y"  
"Avg.tBodyAcc-std()-Z"  
"Avg.tGravityAcc-std()-X"  
"Avg.tGravityAcc-std()-Y"  
"Avg.tGravityAcc-std()-Z"  
"Avg.tBodyAccJerk-std()-X"  
"Avg.tBodyAccJerk-std()-Y"  
"Avg.tBodyAccJerk-std()-Z"  
"Avg.tBodyGyro-std()-X"  
"Avg.tBodyGyro-std()-Y"  
"Avg.tBodyGyro-std()-Z"  
"Avg.tBodyGyroJerk-std()-X"  
"Avg.tBodyGyroJerk-std()-Y"  
"Avg.tBodyGyroJerk-std()-Z"  
"Avg.tBodyAccMag-std()"  
"Avg.tGravityAccMag-std()"  
"Avg.tBodyAccJerkMag-std()"  
"Avg.tBodyGyroMag-std()"  
"Avg.tBodyGyroJerkMag-std()"  
"Avg.fBodyAcc-std()-X"  
"Avg.fBodyAcc-std()-Y"  
"Avg.fBodyAcc-std()-Z"  
"Avg.fBodyAccJerk-std()-X"  
"Avg.fBodyAccJerk-std()-Y"  
"Avg.fBodyAccJerk-std()-Z"  
"Avg.fBodyGyro-std()-X"  
"Avg.fBodyGyro-std()-Y"  
"Avg.fBodyGyro-std()-Z"  
"Avg.fBodyAccMag-std()"  
"Avg.fBodyBodyAccJerkMag-std()"  
"Avg.fBodyBodyGyroMag-std()"  
"Avg.fBodyBodyGyroJerkMag-std()"  

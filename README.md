# README.md file
John C. McDavid, 10/16/2016

# GetCleanData-II--CourseProject
Course Project for Coursera Getting and Cleaning Data - October 2016

## Analysis of Human Activity Using Smartphones Dataset (Version 1.0)

## Analysis
This analysis averages the means and standard deviations of each recorded measurement from the database of observations using R code. For how to run the analysis, see "Method" below.

## Process
R code "run_analysis.R" was developed to process the files, explore and manipulate the datasets, and run the summary analysis on selected variables of a dataset. The code produces a tidy data set that gives the average of each variable selected (see below and "Data" in the accompanying CodeBook.md).  This results in data for 30 subjects, six activity descriptions, and for each of 66 features (data elements).

## Experiment (data collection):
30 volunteers of ages 19-48 were asked to perform six activities (walking, walking upstairs, walking downstairs, sitting, standing, laying) wearing a Samsung smartphone. Data were collected for each subject and activity on 561 features (data elements) using the smartphone's embedded accelerometer and gyroscope. The data was partitioned randomly into two datasets where 70% of the subjects were assigned to the training dataset and 30% to the test dataset.

The researchers captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz using the embedded accelerometer and gyroscope. The sensor signals were pre-processed by applying noise filters and gravitational filters (with assumptions). The time domain signals (tAcc and tGyro where t is for time) were filtered using median and low pass Butterworth filters along with a cutoff frequency to remove noise. The acceleration signal was separated into body motion and gravity components using a Butterworth filter. Jerk (rate of change in accelearation) signals and their maginitudes were derived from linear acceleration and angular velocity through time. The data was normalized to (-1,1). Some data had Fast Fourier Transform applied to it. After normalization the data is dimensionless.

## Method of this Analysis
A training and test dataset was combined into a single dataset for analysis.  The training (7352 obs) and test (2947 obs) datasets of 561 features (cols) were of identical composition (layout).

Each dataset (training, test) had corresponding datasets that indicated the subject number and the activity for each observation. The training data was column binded into a single dataset (subject number, activity, features); similarly for the test data.   This resulted in two datasets that each had the subject number, activity number (translatable to labels), and 561 features in them. The activity numbers were translated to corresponding Activity Labels.

Next, the resulting training and test datasets were combined by rows.  The combined dataset was subsetted by extracting selected features for summary analysis.  The features selected for summary analysis were all the mean and standard deviation measurement variables. There were 33 mean, 13 meanFreq, and 33 std dev variables (79 total).  There were 7 other variables with "mean" in the text that are angle variables (6 "gravitymean", 1 "Accmean") that I deliberately excluded as not intended to be included by the instructions. (I do include the code in the R code analysis file of how subsets of these excluded variables could have been included if desired; test runs were made).

The summary analysis calculates the average of all the mean and std dev variables by subject number (30) and activity description (6). The file "Signals4" is a proper tidy data file and is written out to the file "Signals4.txt" with a write table statement. To read the table back in use the read.table command as included in the script file and referenced below.
Write statement:
    write.table(Signals4, file = "Signals4.txt", row.names = FALSE)
Read statement:
    Signals4Rd <- read.table(file = "Signals4.txt", header = TRUE, check.names = FALSE, stringsAsFactors = FALSE)
See CodeBook for descriptions of the data and data processing.

## License:
Citation Request from original README.md file:
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.
Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

Citation Request from website:
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013. 
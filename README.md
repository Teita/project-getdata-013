# project-getdata-013
Project assignment  from W3 of Getting and Cleaning Data. 

This file describes any transformation or work performed to obtain
the "tidydataset.txt" file as part of the Getting and Cleaning Data Course 
Project on Coursera, course ID=getdata-013.


# Original Dataset Information #

## Name and version
Human Activity Recognition Using Smartphones Dataset, Version 1.0.

## Authors 
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit? degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

## Description 
The data provided from the Course project website represents data collected
from the accelerometers from the Samsung Galaxy S smartphone.
The experiments have been carried out with a group of 30 volunteers within an age 
bracket of 19-48 years. Each person performed six activities (WALKING, 
WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a 
smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer 
and gyroscope, we captured 3-axial linear acceleration and 3-axial angular 
velocity at a constant rate of 50Hz. The experiments have been video-recorded 
to label the data manually. The obtained dataset has been randomly partitioned 
into two sets, where 70% of the volunteers was selected for generating the 
training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying 
noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 
50% overlap (128 readings/window). The sensor acceleration signal, which has 
gravitational and body motion components, was separated using a Butterworth 
low-pass filter into body acceleration and gravity. The gravitational force 
is assumed to have only low frequency components, therefore a filter with 
0.3 Hz cutoff frequency was used. From each window, a vector of features was 
obtained by calculating variables from the time and frequency domain. 

## The data and corresponding files for the project can be found here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## A full description on where the data for the project was obtained can be found here: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


# The instructions to clean the data were as follow 
Create one R script called run_analysis.R that does the following:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for 
each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set 
with the average of each variable for each activity and each subject.


# The run_analysis.R script performs the following steps to clean the data 

1. After setting your working directory where the UCI HAR dataset was downloaded,
read the data into a table located in the files:
        
"features.txt"
"activity_labels.txt"
"subject_train.txt"
"x_train.txt"
"y_train.txt"
"subject_test.txt"
"x_test.txt"
"y_test.txt"

2. Create three datasets by merging the subject, X, and y files together.
3. Rename the merged subject dataset "subject" and the merged dataset y "activity"
4. Extract the columns "mean" and "std" and discard the rest
5. Rename the features columns with the names provided in "feature.txt"
6. Give descriptive names to activity labels
7. Bind the three datasets into a single one
8. Calculate the "mean" of columns in your merged data by using the melt() and 
dcast() functions
9. Export the tidy dataset

# Notes 
- Package used: Reshape2
- You can find additional information about the variables in the Codebook.md file

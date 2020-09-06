---
title: "CodeBock"
author: "Abdoul Kader"
date: "06/09/2020"
output: html_document
editor_options: 
  chunk_output_type: console
---


## Variables

Activity : the activity done, can  be: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

subject : the id of th subject

These data are the average of each variable for each activity and each subject along an axis (X,Y and Z).

TimeBodyAccelerometer
TimeGravityAccelerometer
TimeBodyAccelerometerJerk
TimeBodyGyroscope
TimeBodyGyroscopeJerk
TimeBodyAccelerometerMagnitude
TimeGravityAccelerometerMagnitude
TimeBodyAccelerometerJerkMagnitude
TimeBodyGyroscopeMagnitude
TimeBodyGyroscopeJerkMagnitude
FrequencyBodyAccelerometer
FrequencyBodyAccelerometerJerk
FrequencyBodyGyroscope
FrequencyBodyAccelerometerMagnitude
FrequencyBodyAccelerometerJerkMagnitude
FrequencyBodyGyroscopeMagnitude
FrequencyBodyGyroscopeJerkMagnitude
Angle


## Data

The data come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals 
(tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 


## Trasformation
The following are done on data set to get tidy data set

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average    of each variable for each activity and each subject.


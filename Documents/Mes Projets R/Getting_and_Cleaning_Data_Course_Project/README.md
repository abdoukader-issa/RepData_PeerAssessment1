---
title: "README"
author: "Abdoul Kader"
date: "06/09/2020"
output: html_document
---


## Getting and Cleanning Data Course Project

This project is a submission for the exam at the end of the Getting and Cleaning Data course. It is about recognizing human activity using a smartphone : Human Activity Recognition Using Smartphones Dataset.


## Working of the Script

First we have to download and unzip files (if necessary). The file zip is accessible through the link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Then we can follow all steps of instructions :

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average    of each variable for each activity and each subject.
6. Extraction data in a file

## Files

run.analysis.R : R script use to perform all operations on data set.

CodeBook.md : describes the variables, the data, and any transformations or work that I performed to clean up the data

average_by_activity_subject.txt : the result after running the script R.



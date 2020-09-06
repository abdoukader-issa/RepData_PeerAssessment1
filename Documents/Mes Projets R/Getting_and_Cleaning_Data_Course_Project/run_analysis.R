### Getting and Cleaning Data Course Project

## download project documents if not exist

doc <- "Course_Project_week4.zip"
if(!file.exists(doc)){
  doc_url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(doc_url,doc)
}

## unzipping files
if (file.exists("Course_Project_week4.zip")) { 
  unzip(doc) 
}

## charging files in data frames

features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")


## Merges the training and the test sets to create one data set

X_merged <- rbind(x_train, x_test)
Y_merged <- rbind(y_train, y_test)
Subject <- rbind(subject_train, subject_test)
Merged_Data <- cbind(Subject, X_merged, Y_merged)

## Extracts only the measurements on the mean and standard deviation for each measurement
library(dplyr)
mean_std_extract <- Merged_Data %>% 
  select(subject, code, contains("mean"), contains("std"))

##Uses descriptive activity names to name the activities in the data set

mean_std_extract$code <- activities[mean_std_extract$code, 2]


## Appropriately labels the data set with descriptive variable names

names(mean_std_extract)[2] = "Activity"
names(mean_std_extract)<-gsub("Acc", "Accelerometer", names(mean_std_extract))
names(mean_std_extract)<-gsub("Gyro", "Gyroscope", names(mean_std_extract))
names(mean_std_extract)<-gsub("BodyBody", "Body", names(mean_std_extract))
names(mean_std_extract)<-gsub("Mag", "Magnitude", names(mean_std_extract))
names(mean_std_extract)<-gsub("^t", "Time", names(mean_std_extract))
names(mean_std_extract)<-gsub("^f", "Frequency", names(mean_std_extract))
names(mean_std_extract)<-gsub("tBody", "TimeBody", names(mean_std_extract))
names(mean_std_extract)<-gsub("-mean()", "Mean", names(mean_std_extract), ignore.case = TRUE)
names(mean_std_extract)<-gsub("-std()", "STD", names(mean_std_extract), ignore.case = TRUE)
names(mean_std_extract)<-gsub("-freq()", "Frequency", names(mean_std_extract), ignore.case = TRUE)
names(mean_std_extract)<-gsub("angle", "Angle", names(mean_std_extract))
names(mean_std_extract)<-gsub("gravity", "Gravity", names(mean_std_extract))


## From the data set in step 4, creates a second, independent tidy data set with 
##the average of each variable for each activity and each subject

average_by_activity_subject <- mean_std_extract %>%
  group_by(Activity, subject)%>%
  summarise_all(funs(mean))

## extracting data

write.table(average_by_activity_subject, "average_by_activity_subject.txt", row.name=FALSE)



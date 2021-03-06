# Getting and Cleaning Data

## Course project

You should create one R script called run_analysis.R that does the following. 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Steps to execute the script

1. Create a directory GCD_Project under the C:/R directory structure
2. Download the zip file from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
3. Unzip the file under the GCD_Project directory
4. you will have a UCI HAR Dataset sub directory under the GCD_Project
5. Run source("run_analsyis.R") command
6. It will create a tidy_combined_avg_dataset.txt file under the GCD_Project directory

## Dependencies

It depends on data.table package


# THis R script merges two data sets, training and test data sets to create a single data set for analysis.
# Prio to execution of the script, source data is downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
# unzipped and staged in the GCD_Project directory
# 



## Read the data sets

## Read the Training data sets

train_x <- read.table("C:/R/GCD_Project/UCI HAR Dataset/train/X_train.txt")

train_y <- read.table("C:/R/GCD_Project/UCI HAR Dataset/train/y_train.txt")

train_subject <- read.table("C:/R/GCD_Project/UCI HAR Dataset/train/subject_train.txt")

## Read the Test data sets

test_x <- read.table("C:/R/GCD_Project/UCI HAR Dataset/test/X_test.txt")

test_y <- read.table("C:/R/GCD_Project/UCI HAR Dataset/test/y_test.txt")

test_subject <- read.table("C:/R/GCD_Project/UCI HAR Dataset/test/subject_test.txt")

## Merge the Training and test data sets
x <- rbind(train_x,test_x)
y <- rbind(train_y,test_y)
s <- rbind(train_subject,test_subject)

## Read features labels
features <- read.table("C:/R/GCD_Project/UCI HAR Dataset/features.txt")

# Friendly names to features column
names(features) <- c('feat_id', 'feat_name')

# Search for matches to argument mean or standard deviation (sd)  within each element of character vector
index_features <- grep("-mean\\(\\)|-std\\(\\)", features$feat_name) 
x <- x[, index_features] 
# Replaces all matches of a string features 
names(x) <- gsub("\\(|\\)", "", (features[index_features, 2]))



## Use descriptive activity names to name the activities in the data set:
## Appropriately labels the data set with descriptive activity names:
# Read activity labels
activities <- read.table("C:/R/GCD_Project/UCI HAR Dataset/activity_labels.txt")
# Friendly names to activities column
names(activities) <- c('act_id', 'act_name')
y[, 1] = activities[y[, 1], 2]

names(y) <- "Activity"
names(s) <- "Subject"

# Combines data table by columns
tidyDataSet <- cbind(s, y, x)


# 5. Creates a 2nd, independent tidy data set with the average of each variable for each activity and each subject:
p <- tidyDataSet[, 3:dim(tidyDataSet)[2]] 
tidyDataAVGSet <- aggregate(p,list(tidyDataSet$Subject, tidyDataSet$Activity), mean)

# Activity and Subject name of columns 
names(tidyDataAVGSet)[1] <- "Subject"
names(tidyDataAVGSet)[2] <- "Activity"# Created csv (tidy data set) in diretory

# Created csv (tidy data set) in diretory
write.table(tidyDataSet, "C:/R/GCD_Project/tidy-combined-dataset.txt")
# Created csv (tidy data set AVG) in diretory
# write.csv(tidyDataAVGSet, tidyDataFileAVG)
# Created txt (tidy data set AVG) in diretory
write.table(tidyDataAVGSet, "C:/R/GCD_Project/tidy_combined_avg_dataset.txt",row.name=FALSE)

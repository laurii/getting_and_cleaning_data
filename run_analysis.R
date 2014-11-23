# Getting and cleaning data
# Assignement 3 
# Creted by Lauri Ilison
# Date: 2014_11_23

# Task
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 

## import required libraries
library(plyr)

## Read test and train data 
## Reading x -data and merging test and trainset
df.train.x <- read.csv(file = "UCI HAR Dataset/train/X_train.txt",sep = "", header = FALSE)
df.test.x <- read.csv(file = "UCI HAR Dataset/test/X_test.txt",sep = "", header = FALSE)
df.x <- rbind(df.train.x,df.test.x)

## Reading y-data and merging test and trainset
df.train.y <- read.csv(file = "UCI HAR Dataset/train/Y_train.txt", sep = "", header = FALSE)
df.test.y <- read.csv(file = "UCI HAR Dataset/test/Y_test.txt",sep = "", header = FALSE)
df.y <- rbind(df.train.y,df.test.y)

## Reading subject-data and merging treain and test set
df.subject.train <- read.csv(file = "UCI HAR Dataset/train/subject_train.txt", sep = "", header = FALSE)
df.subject.test <- read.csv(file = "UCI HAR Dataset/test/subject_test.txt",sep = "", header = FALSE)
df.subject <- rbind(df.subject.train,df.subject.test)

## Reading feature labels
features <- read.csv(file = "UCI HAR Dataset/features.txt",sep = "",header=FALSE)

## Find the columns that have mean or sdt values, format the column names
req.col.ids <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
req.col.names <- features[c(as.vector(req.col.ids)),2]
req.col.names <- gsub('[()]', '', req.col.names)
req.col.names <- gsub('mean', 'Mean', req.col.names)
req.col.names <- gsub('std', 'Std', req.col.names)
req.col.names <- gsub('-', '', req.col.names)

## Filter x-data with required columns
df.x <- df.x[,req.col.ids]

## Label the x-data with approporiate column names 
names(df.x) <- req.col.names

## Read activities and format the activity labels
activities <- read.csv(file = "UCI HAR Dataset/activity_labels.txt",sep= "", header = FALSE)
activities[,2] <- gsub("_","",activities[,2])
activities[,2] <- tolower(activities[,2])

## Merge activity labels with y-data
df.y <- as.data.frame(activities[df.y[,1],2])

## Label the columns for df.y and df.subject data frames 
names(df.y) <- "activity"
names(df.subject) <- "subjectid"

## Merge all data
df.all <- cbind(df.x,df.y,df.subject)

## Create aggregated view for mean values for Mean and std columns
excl.cols <- which(names(df.all) %in% c("subjectid", "activity"))
## Create aggregated view for mean values for Mean and std columns
tidy <- ddply(df.all, .(subjectid,activity), .fun = function(x){ colMeans(x[,-excl.cols]) })

## Save the result in tidy dataset
write.table(tidy, "tidy.txt", sep = "\t",row.name=FALSE)
View(tidy)

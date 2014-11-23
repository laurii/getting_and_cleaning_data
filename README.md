Getting and Cleaning Data
=========================

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected. 

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

- [description] http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

  Here are the data for the project:

- [source] https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

 You should create one R script called run_analysis.R that does the following. 

* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 

From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Implementation
======================================
To generate dataset follow the steps

1. Checkout the repo
2. Download the dataset https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and unzip in the repo folder.
3. Run the script source("run_analysis.R")

The script requires package plyr.

Description of the process is as follows:

### Tidy data-set creation process

The tidy dataset is created using following steps:

1. Train and Test sets fo x-data is merged

2. Train and Test sets of y-data is merged

3. Train and Test sets of subject data is merged

4. Features dataset is created 
      + measurements consisting Mean and Std values are filtered 
      
      + column names are formated ("tGravityAcc-mean()-X" has been transformed to "tGravityAccMeanX")

5. The subset of x-data with required feature labelled columns is created

6. Activities data labes is created and y-data is relabelled accordingly

7. x-data, y-data and activity-data is merged by columns 

8. Tidy dataset is created based on the subject data and activity labels aggregation by mean  of measurement values

9. Tidy dataset is saved into tidy.txt file



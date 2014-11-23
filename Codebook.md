Project Codebook
==================================================

### Data

There original data of this analysis is taken from te smartphone accelerometer and gyroscope 3-axial raw signals. It has been processed 
which have been processed using various signal processing techniques to measurement vector consisting of 561 features. 

Detailed description of the dataset is described in `features_info.txt` in
the dataset zipped file.

- [source](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 

- [description](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

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


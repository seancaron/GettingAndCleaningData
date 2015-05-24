#Course Project Codebook  
##Abstract  
Data in the `tidy_data.txt` dataset were derived from the Human Activity Recognition Using Smartphones Dataset available for download as a zip file [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).  

The data has been cleaned and transformed by the R function run_analysis(), available [here](https://github.com/seancaron/GettingAndCleaningData/blob/master/run_analysis.R). A complete [README](https://github.com/seancaron/GettingAndCleaningData/blob/master/README.md) is provide to detail how the tidy_data.txt file was derived from the larger raw dataset.  

This data consists of a set of processed accelerometer and gyroscope readings captured as thirty test subjects performed six defined activities.  **This dataset summarizes the mean of the mean and standard deviation calculations captured in 66 feature variables for each activity/subject combination.**  


##Feature Variables
Feature variables (numeric, normalized to the range [-1,1], inclusive) – The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. A Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

These signals were used to estimate variables of the feature vector for each pattern: 
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

> tBodyAcc-XYZ  
> tGravityAcc-XYZ  
> tBodyAccJerk-XYZ  
> tBodyGyro-XYZ  
> tBodyGyroJerk-XYZ  
> tBodyAccMag  
> tGravityAccMag  
> tBodyAccJerkMag  
> tBodyGyroMag  
> tBodyGyroJerkMag  
> fBodyAcc-XYZ  
> fBodyAccJerk-XYZ  
> fBodyGyro-XYZ  
> fBodyAccMag  
> fBodyAccJerkMag  
> fBodyGyroMag  
> fBodyGyroJerkMag  

Features were then normalized and bounded within the range [-1,1]

In the tidy_data.txt table, each XYZ axial signal is decomposed into a mean and standard deviation standardized value in each vector direction (x, y & z). Magnitude values without direction vectors have a mean and standard deviation standardized value each.   


Variables |  number
----------|-----------
identification variables - activity, subject | 2 variables
mean of 8 directional vectors * 3 directions |  24 variables  
stddev of 8 directional vectors * 3 directions | 24 variables  
mean of 9 magnitude variables |  9 variables  
stddev of 9 magnitude variables | 9 variables  
total | 68 variables


There are 6 activites, 30 subjects, for a total of 180 observations

Data set size is then **180 rows by 68 columns**


#Column Variables (68) - tidy_data.txt

1. subject (integer) – subject ID. A number between 1 and 30 (inclusive). The experiments have been carried out with a group of 30 subject volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.  
2. Activity (character) – Identifies the different activities performed by a subject. Values are:
> WALKING  
> WALKING_UPSTAIRS  
> WALKING_DOWNSTAIRS  
> SITTING  
> STANDING  
> LAYING  

column | mean(feature variable) |  more descriptive feature name
---------|-----------|-----------
3 | tBodyAcc.mean...X | timeBodyAccelerometer-mean()-X
4 | tBodyAcc.mean...Y | timeBodyAccelerometer-mean()-Y
5 | tBodyAcc.mean...Z | timeBodyAccelerometer-mean()-Z
6 | tGravityAcc.mean...X | timeGravityAccelerometer-mean()-X
7 | tGravityAcc.mean...Y | timeGravityAccelerometer-mean()-Y
8 | tGravityAcc.mean...Z | timeGravityAccelerometer-mean()-Z
9 | tBodyAccJerk.mean...X | timeBodyAccelerometerJerk-mean()-X
10 | tBodyAccJerk.mean...Y | timeBodyAccelerometerJerk-mean()-Y
11 | tBodyAccJerk.mean...Z | timeBodyAccelerometerJerk-mean()-Z
12 | tBodyGyro.mean...X | timeBodyGyroscope-mean()-X
13 | tBodyGyro.mean...Y | timeBodyGyroscope-mean()-Y
14 | tBodyGyro.mean...Z | timeBodyGyroscope-mean()-Z
15 | tBodyGyroJerk.mean...X | timeBodyGyroscopeJerk-mean()-X
16 | tBodyGyroJerk.mean...Y | timeBodyGyroscopeJerk-mean()-Y
17 | tBodyGyroJerk.mean...Z | timeBodyGyroscopeJerk-mean()-Z
18 | tBodyAccMag.mean | timeBodyAccelerometerMagnitude-mean()
19 | tGravityAccMag.mean | timeGravityAccelerometerMagnitude-mean()
20 | tBodyAccJerkMag.mean | timeBodyAccelerometerJerkMagnitude-mean()
21 | tBodyGyroMag.mean | timeBodyGyroscopeMagnitude-mean()
22 | tBodyGyroJerkMag.mean | timeBodyGyroscopeJerkMagnitude-mean()
23 | fBodyAcc.mean...X | frequencyBodyAccelerometer-mean()-X
24 | fBodyAcc.mean...Y | frequencyBodyAccelerometer-mean()-Y
25 | fBodyAcc.mean...Z | frequencyBodyAccelerometer-mean()-Z
26 | fBodyAccJerk.mean...X | frequencyBodyAccelerometerJerk-mean()-X
27 | fBodyAccJerk.mean...Y | frequencyBodyAccelerometerJerk-mean()-Y
28 | fBodyAccJerk.mean...Z | frequencyBodyAccelerometerJerk-mean()-Z
29 | fBodyGyro.mean...X | frequencyBodyGyroscope-mean()-X
30 | fBodyGyro.mean...Y | frequencyBodyGyroscope-mean()-Y
31 | fBodyGyro.mean...Z | frequencyBodyGyroscope-mean()-Z
32 | fBodyAccMag.mean | frequencyBodyAccelerometerMagnitude-mean()
33 | fBodyBodyAccJerkMag.mean | frequencyBodyAccelerometerJerkMagnitude-mean()
34 | fBodyBodyGyroMag.mean | frequencyBodyGyroscopeMagnitude-mean()
35 | fBodyBodyGyroJerkMag.mean | frequencyBodyGyroscopeJerkMagnitude-mean()
36 | tBodyAcc.std...X | timeBodyAccelerometer-std()-X
37 | tBodyAcc.std...Y | timeBodyAccelerometer-std()-Y
38 | tBodyAcc.std...Z | timeBodyAccelerometer-std()-Z
39 | tGravityAcc.std...X | timeGravityAccelerometer-std()-X
40 | tGravityAcc.std...Y | timeGravityAccelerometer-std()-Y
41 | tGravityAcc.std...Z | timeGravityAccelerometer-std()-Z
42 | tBodyAccJerk.std...X | timeBodyAccelerometerJerk-std()-X
43 | tBodyAccJerk.std...Y | timeBodyAccelerometerJerk-std()-Y
44 | tBodyAccJerk.std...Z | timeBodyAccelerometerJerk-std()-Z
45 | tBodyGyro.std...X | timeBodyGyroscope-std()-X
46 | tBodyGyro.std...Y | timeBodyGyroscope-std()-Y
47 | tBodyGyro.std...Z | timeBodyGyroscope-std()-Z
48 | tBodyGyroJerk.std...X | timeBodyGyroscopeJerk-std()-X
49 | tBodyGyroJerk.std...Y | timeBodyGyroscopeJerk-std()-Y
50 | tBodyGyroJerk.std...Z | timeBodyGyroscopeJerk-std()-Z
51 | tBodyAccMag.std | timeBodyAccelerometerMagnitude-std()
52 | tGravityAccMag.std | timeGravityAccelerometerMagnitude-std()
53 | tBodyAccJerkMag.std | timeBodyAccelerometerJerkMagnitude-std()
54 | tBodyGyroMag.std | timeBodyGyroscopeMagnitude-std()
55 | tBodyGyroJerkMag.std | timeBodyGyroscopeJerkMagnitude-std()
56 | fBodyAcc.std...X | frequencyBodyAccelerometer-std()-X
57 | fBodyAcc.std...Y | frequencyBodyAccelerometer-std()-Y
58 | fBodyAcc.std...Z | frequencyBodyAccelerometer-std()-Z
59 | fBodyAccJerk.std...X | frequencyBodyAccelerometerJerk-std()-X
60 | fBodyAccJerk.std...Y | frequencyBodyAccelerometerJerk-std()-Y
61 | fBodyAccJerk.std...Z | frequencyBodyAccelerometerJerk-std()-Z
62 | fBodyGyro.std...X | frequencyBodyGyroscope-std()-X
63 | fBodyGyro.std...Y | frequencyBodyGyroscope-std()-Y
64 | fBodyGyro.std...Z | frequencyBodyGyroscope-std()-Z
65 | fBodyAccMag.std | frequencyBodyAccelerometerMagnitude-std()
66 | fBodyBodyAccJerkMag.std | frequencyBodyAccelerometerJerkMagnitude-std()
67 | fBodyBodyGyroMag.std | frequencyBodyGyroscopeMagnitude-std()
68 | fBodyBodyGyroJerkMag.std | frequencyBodyGyroscopeJerkMagnitude-std()

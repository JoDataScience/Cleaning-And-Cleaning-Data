# CodeBook

## General Remark - Original dataset:
The original dataset, and detailed information about it are available at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones .
This CodeBook only describes the variables that remain in the new dataset, created from the original one. This new dataset aims at being smaller and cleaner, following the principles of "tidy dataset". 

## Features of the original dataset - overview (information from original dataset): 
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

**Note:** Features are normalized and bounded within [-1,1].

- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

- mean(): Mean value
- std(): Standard deviation
- mad(): Median absolute deviation 
- max(): Largest value in array
- min(): Smallest value in array
- sma(): Signal magnitude area
- energy(): Energy measure. Sum of the squares divided by the number of values. 
- iqr(): Interquartile range 
- entropy(): Signal entropy
- arCoeff(): Autorregresion coefficients with Burg order equal to 4
- correlation(): correlation coefficient between two signals
- maxInds(): index of the frequency component with largest magnitude
- meanFreq(): Weighted average of the frequency components to obtain a mean frequency
- skewness(): skewness of the frequency domain signal 
- kurtosis(): kurtosis of the frequency domain signal 
- bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
- angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

- gravityMean
- tBodyAccMean
- tBodyAccJerkMean
- tBodyGyroMean
- tBodyGyroJerkMean

## Transformations made to create the second, smaller (and cleaner/tidy) dataset: 
1. The training and testing sets have been merged together to create one single dataset. 
2. Only the measures regarding the **mean** and **standard deviation** of the different features have been kept (out of the initial 561-feature vector).
3. The acitivities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) are now referred to by their label and not number from 0 to 6.
4. The name of the features have been used to label the variables (that is, the columns) of the dataset. 
5. The final tidy dataset only accounts for the average values, **for each subject and each acitivity**, this represents 68 variables, listed in the next section.

## Exhaustive list of the 68 variables of the clean dataset:

1. activity                   : Factor with 6 levels "WALKING","WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "TANDING", "LAYING"
2. subject                    : int  
3. tBodyAcc-mean()-X          : num  
4. tBodyAcc-mean()-Y          : num  
5. tBodyAcc-mean()-Z          : num  
6. tBodyAcc-std()-X           : num  
7. tBodyAcc-std()-Y           : num  
8. tBodyAcc-std()-Z           : num  
9. tGravityAcc-mean()-X       : num  
10.	tGravityAcc-mean()-Y       : num  
11.	tGravityAcc-mean()-Z       : num  
12.	tGravityAcc-std()-X        : num  
13.	tGravityAcc-std()-Y        : num  
14.	tGravityAcc-std()-Z        : num  
15.	tBodyAccJerk-mean()-X      : num  
16.	tBodyAccJerk-mean()-Y      : num  
17.	tBodyAccJerk-mean()-Z      : num 
18.	tBodyAccJerk-std()-X       : num  
19.	tBodyAccJerk-std()-Y       : num  
20.	tBodyAccJerk-std()-Z       : num  
21.	tBodyGyro-mean()-X         : num  
22.	tBodyGyro-mean()-Y         : num  
23.	tBodyGyro-mean()-Z         : num  
24.	tBodyGyro-std()-X          : num  
25.	tBodyGyro-std()-Y          : num  
26.	tBodyGyro-std()-Z          : num  
27.	tBodyGyroJerk-mean()-X     : num  
28.	tBodyGyroJerk-mean()-Y     : num  
29.	tBodyGyroJerk-mean()-Z     : num  
30.	tBodyGyroJerk-std()-X      : num  
31.	tBodyGyroJerk-std()-Y      : num  
32.	tBodyGyroJerk-std()-Z      : num  
33.	tBodyAccMag-mean()         : num  
34.	tBodyAccMag-std()          : num  
35.	tGravityAccMag-mean()      : num  
36.	tGravityAccMag-std()       : num  
37.	tBodyAccJerkMag-mean()     : num  
38.	tBodyAccJerkMag-std()      : num  
39.	tBodyGyroMag-mean()        : num  
40.	tBodyGyroMag-std()         : num  
41.	tBodyGyroJerkMag-mean()    : num  
42.	tBodyGyroJerkMag-std()     : num  
43.	fBodyAcc-mean()-X          : num  
44.	fBodyAcc-mean()-Y          : num  
45.	fBodyAcc-mean()-Z          : num  
46.	fBodyAcc-std()-X           : num  
47.	fBodyAcc-std()-Y           : num  
48.	fBodyAcc-std()-Z           : num  
49.	fBodyAccJerk-mean()-X      : num  
50.	fBodyAccJerk-mean()-Y      : num  
51.	fBodyAccJerk-mean()-Z      : num  
52.	fBodyAccJerk-std()-X       : num  
53.	fBodyAccJerk-std()-Y       : num  
54.	fBodyAccJerk-std()-Z       : num  
55.	fBodyGyro-mean()-X         : num  
56.	fBodyGyro-mean()-Y         : num  
57.	fBodyGyro-mean()-Z         : num  
58.	fBodyGyro-std()-X          : num  
59.	fBodyGyro-std()-Y          : num  
60.	fBodyGyro-std()-Z          : num  
61.	fBodyAccMag-mean()         : num  
62.	fBodyAccMag-std()          : num  
63.	fBodyBodyAccJerkMag-mean() : num  
64.	fBodyBodyAccJerkMag-std()  : num  
65.	fBodyBodyGyroMag-mean()    : num  
66.	fBodyBodyGyroMag-std()     : num  
67. fBodyBodyGyroJerkMag-mean(): num  
68. fBodyBodyGyroJerkMag-std() : num  

---
title: "UCI_HAR_Tidy_Dataset_Codebook"
author: "FWeltewitz"
date: "Sunday, July 26, 2015"
output: html_document
---

This codebook was written to modify the existing codebook for the UCI HAR 
Dataset and assist in the interpretation in the tidy dataset created by the 
run_analysis.R function.

### Dataset
UCI_HAR_Tidy_Dataset.txt contains a tidy dataset based on the Human Activity 
Recognition Using Smartphone dataset collected and published by Jorge L. 
Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto and Xavier Parra: 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. 
Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass 
Hardware-Friendly Support Vector Machine. International Workshop of Ambient 
Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

For full information on the original data, see: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

From the codebook of the original dataset:

> The features selected for this database come from the accelerometer and gyro-
> scope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals 
> (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then 
> they were filtered using a median filter and a 3rd order low pass Butterworth 
> filter with a corner frequency of 20 Hz to remove noise. Similarly, the 
> acceleration signal was then separated into body and gravity acceleration 
> signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth 
> filter with a corner frequency of 0.3 Hz. 

> Subsequently, the body linear acceleration and angular velocity were derived in 
> time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the 
> magnitude of these three-dimensional signals were calculated using the 
> Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, 
> tBodyGyroJerkMag). 

> Finally a Fast Fourier Transform (FFT) was applied to some of these signals 
> producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, 
> fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain 
> signals). 

> These signals were used to estimate variables of the feature vector for each 
> pattern:  
> '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

### Variables

The tidy dataset summarises the full dataset by summarising the above readings
for each activity by subject. Two summary statistics are provided: the mean
of readings, denoted "mean()", when the subject engaged in the activity, and 
the standard deviation of those readings, denoted "std()". 
The 68 variables are:

* Activity<br>
The subjects engaged in one of six activities. This string variable denotes
these activities can can take the values: LAYING, SITTING, STANDING, WALKING,
WALKING_DOWNSTAIRS and WALKING_UPSTAIRS

* Subject.ID<br>
The ID of the subject undertaking the activity. Integer from 1 to 30

* Subject-mean-tBodyAcc-mean()-XYZ<br>
Average time domain body acceleratometer signal for on one of X, Y or Z axis. Obtained by subtracting gravity acceleration from total measurement. In standard gravity units "g", normalised to fall within [-1,1]. 

* Subject-mean-tGravityAcc-mean()-XYZ<br>
Average time domain gravity acceleratometer signal for on one of X, Y or Z axis. In standard gravity units "g", normalised to fall within [-1,1]. 

* Subject-mean-tBodyAccJerk-mean()-XYZ<br>
Average derived time domain body acceleratometer jerk signal for on one of 
X, Y or Z axis. Obtained by subtracting gravity acceleration from total measurement. In standard gravity units "g", normalised to fall within [-1,1].

* Subject-mean-tBodyGyro-mean()-XYZ<br>
Average time domain body gyro signal for on one of X, Y or Z axis. Obtained by subtracting gravity acceleration from total measurement. In radians per second, normalised to fall within [-1,1]. 

* Subject-mean-tBodyGyroJerk-mean()-XYZ<br>
Average derived time domain body gyro jerk signal for on one of X, Y or Z axis. Obtained by subtracting gravity acceleration from total measurement. In radians per second, normalised to fall within [-1,1].

* Subject-mean-tBodyAccMag-mean()<br>
Average time domain body acceleratometer signal magnitude.Obtained by subtracting gravity acceleration from total measurement. In standard gravity units "g", normalised to fall within [-1,1].

* Subject-mean-tGravityAccMag-mean()<br>
Average time domain gravity acceleratometer signal magnitude. In standard gravity units "g", normalised to fall within [-1,1].

* Subject-mean-tBodyAccJerkMag-mean()<br>
Average derived time domain body acceleratometer jerk signal magnitude. Obtained by subtracting gravity acceleration from total measurement. In standard gravity units "g", normalised to fall within [-1,1].

* Subject-mean-tBodyGyroMag-mean()<br>
Average time domain body gyro signal magnitude. Obtained by subtracting gravity acceleration from total measurement. In radians per second, normalised to fall within [-1,1].

* Subject-mean-tBodyGyroJerkMag-mean()<br>
Average derived time domain body gyro jerk signal magnitude. Obtained by subtracting gravity acceleration from total measurement. In radians per second, normalised to fall within [-1,1].

* Subject-mean-fBodyAcc-mean()-XYZ<br>
Average frequency domain body acceleratometer signal for on one of X, Y or Z 
axis. Obtained by subtracting gravity acceleration from total measurement. In standard gravity units "g", normalised to fall within [-1,1].

* Subject-mean-fBodyAccJerk-mean()-XYZ<br>
Average derived frequency domain body acceleratometer jerk signal for on one of X, Y or Z 
axis. Obtained by subtracting gravity acceleration from total measurement. In standard gravity units "g", normalised to fall within [-1,1].

* Subject-mean-fBodyGyro-mean()-XYZ<br>
Average frequency domain body gyro signal for on one of X, Y or Z axis. Obtained by subtracting gravity acceleration from total measurement. In radians per second, normalised to fall within [-1,1].

* Subject-mean-fBodyAccMag-mean()<br>
Average frequency domain body acceleratometer signal magnitude. Obtained by subtracting gravity acceleration from total measurement. In standard gravity units "g", normalised to fall within [-1,1].

* Subject-mean-fBodyAccJerkMag-mean()<br>
Average derived frequency domain body acceleratometer jerk signal magnitude. Obtained by subtracting gravity acceleration from total measurement. In standard gravity units "g", normalised to fall within [-1,1].

* Subject-mean-fBodyGyroMag-mean()<br>
Average frequency domain body gyro signal magnitude. Obtained by subtracting gravity acceleration from total measurement. In radians per second, normalised to fall within [-1,1].

* Subject-mean-fBodyGyroJerkMag-mean()<br>
Average derived frequency domain body gyro jerk signal magnitude. Obtained by subtracting gravity acceleration from total measurement. In radians per second, normalised to fall within [-1,1].

* Subject-mean-tBodyAcc-std()-XYZ<br>
Standard deviation of time domain body acceleratometer signals for on one of X, 
Y or Z axis. In standard gravity units "g". 

* Subject-mean-tGravityAcc-std()-XYZ<br>
Standard deviation of time domain gravity acceleratometer signals for on one of 
X, Y or Z axis. In standard gravity units "g". 

* Subject-mean-tBodyAccJerk-std()-XYZ<br>
Standard deviation of derived time domain body acceleratometer jerk signals for 
on one of X, Y or Z axis. In standard gravity units "g".

* Subject-mean-tBodyGyro-std()-XYZ<br>
Standard deviation of time domain body gyro signals for on one of X, Y or Z axis. In radians per second. 

* Subject-mean-tBodyGyroJerk-std()-XYZ<br>
Standard deviation of derived time domain body gyro jerk signals for on one of 
X, Y or Z axis. In radians per second.

* Subject-mean-tBodyAccMag-std()<br>
Standard deviation of the magnitude of time domain body acceleratometer signals. In standard gravity units "g".

* Subject-mean-tGravityAccMag-std()<br>
Standard deviation of the magnitude of time domain gravity acceleratometer 
signals. In standard gravity units "g".

* Subject-mean-tBodyAccJerkMag-std()<br>
Standard deviation of the magnitude of derived time domain body acceleratometer 
jerk signals. In standard gravity units "g".

* Subject-mean-tBodyGyroMag-std()<br>
Standard deviation of the magnitude of time domain body gyro signals. In standard gravity units "g".

* Subject-mean-tBodyGyroJerkMag-std()<br>
Standard deviation of the magnitude of derived time domain body gyro jerk 
signals. In radians per second.

* Subject-mean-fBodyAcc-std()-XYZ<br>
Standard deviation of frequency domain body acceleratometer signals for on one 
of X, Y or Z axis. In standard gravity units "g". 

* Subject-mean-fBodyAccJerk-std()-XYZ<br>
Standard deviation of derived frequency domain body acceleratometer jerk signals 
for on one of X, Y or Z axis. In standard gravity units "g".

* Subject-mean-fBodyGyro-mean()-XYZ<br>
Standard deviation of frequency domain body gyro signals for on one of X, Y or 
Z axis. In radians per second.

* Subject-mean-fBodyAccMag-mean()<br>
Standard deviation of the magnitude of frequency domain body acceleratometer 
signals. In standard gravity units "g".

* Subject-mean-fBodyAccJerkMag-mean()<br>
Standard deviation of the magnitude of derived frequency domain body 
acceleratometer jerk signals. In standard gravity units "g".

* Subject-mean-fBodyGyroMag-mean()<br>
Standard deviation of the magnitude of frequency domain body gyro signals. In radians per second.

* Subject-mean-fBodyGyroJerkMag-mean()<br>
Standard deviation of the magnitude of derived frequency domain body gyro jerk 
signals. In radians per second.
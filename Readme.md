---
title: "Readme"
author: "FWeltewitz"
date: "Sunday, July 26, 2015"
output: html_document
---

This readme document explains how I went about completing the course project for
the July 2015 edition of the 'Getting and cleaning data' course offered on Coursera.com. Apologies for the format... I have not taken the course with a greater focus on markdown and documentation just yet.

### Original project instructions
The instructions for the project were as follows:

>The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

>One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

>http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

>Here are the data for the project: 

>https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

>You should create one R script called run_analysis.R that does the following. 
>1. Merges the training and the test sets to create one data set.
>2. Extracts only the measurements on the mean and standard deviation for each measurement. 
>3. Uses descriptive activity names to name the activities in the data set
>4. Appropriately labels the data set with descriptive variable names. 
>5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

>Good luck!

### My interpretation of the project instructions
* I believe that we were asked to calculate the average of the mean and standard deviation readings for each time they engaged in a particular activity, for each individual. The instructions were not completely clear to me on this, but that was what I decided was going on here.
* Where the instructions asked for the measurements on the mean and standard deviation, I took this to mean excluding the 'meanFreq()' measurements, and the mean measurements in the angle category. To me, the ultimate use of this tidy dataset is being able to determine the statistical significance of the differences between the readings for various activities for each individual, or alternatively the statistical differences between the readings for the various individuals for each activity. That is: answer questions like "Is the Z axis gyro accelerometer reading different when someone goes up the stairs, rather than going down".
* I am showing my tidy dataset in wide format.
* I used the activity names from the activity_labels.txt file, and used the paste() function on the original variable names from the features.txt to make clear that these are now average readings for each individual across all the times they engaged in the given activity.

### What do you need for my script to work?
* R, obviously, and an internet connection to download the dplyr package if required.
* The unzipped dataset, i.e. the UCI HAR Dataset folder, in your working directory. The file path code I used should be able to get the correct files from within that folder on any system on which R is run.

### What is the output of my script?
* A txt file called UCI_HAR_Dataset_Tidy.txt, which contains the tidy dataset I also uploaded to the Coursera website.
* The dataset has 180 observations for 68 variables. It is "tidy" because each variable has its own separate column, and each row contains one particular observation. That means every row-column combination shows one unique observation for one particular variable.
* The first two variables are "Activity" and "Subject.ID". The first designates the particular activity for which that row is an observation. The "Subject.ID" uniquely identifies the subject that engaged in the activity. The remaining 66 variables are the means and standard deviations of the relevant readings taken from the smartphone that subject was wearing when undertaking the activity. Comparing rows thus allows us to identify how the smartphone data can distinguish between activities and subjects depending on the research question we want to answer.

### How does the script work?
There are comments in my R code to illustrate each particular step. Here instead I divide my explanation by the particular steps we were asked to complete in the project instructions.<br>

1. Merges the training and the test sets to create one data set.<br>
The script uses the read.table() function to load the X_test, X_train, y_test, y_train, subject_test, subject_train, features and activity data into the memory. The X files contain the actual readings, the y files contain codes for the activities, the subject files contain the subject IDs, features contains the variable names and activities contains the actual activities and their codes. I start by column binding the subject and activity IDs to the readings. I do this separately for the test and training data. After completing step 2 on each dataset, I row bind the two together to recreate the full dataset from before it was split by the researchers.<br>
2. Extracts only the measurements on the mean and standard deviation for each measurement.<br>
Because I have combined the variables names from the features file with the dataset, I can extract the mean and standard deviation variables using their variable names. I use the select() function from the dplyr package to only select columns that contain "mean()" or "standard deviation()" (plus the activity and subject IDs). Here I also drop the "angle" and "meanFreq" measurements, as noted above.<br>
3. Uses descriptive activity names to name the activities in the data set<br>
For the majority of the code, I use the Activity.ID variable. At the end, when I have the tidy dataset, I use the inner_join function from the dplyr package to merge the tidy dataset with the activity dataset, using the Activity.ID variable common to both. I then drop the Activity.ID variable from the result so only the descriptive names remain.<br>
4. Appropriately labels the data set with descriptive variable names<br>
To do this, I use the paste() function to add the prefix "Subject-mean-" to each of the variable names that come from the features.txt file. This makes it clear enough what each reading means, especially when considered together with the code book. Given more time however, I would work a little more on making entirely new variable names that are more descriptive still.<br>
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject<br>
To do this step I use the group_by and summarise_each functions from the dplyr package. I first group the complete dataset by Activity.ID and Subject.ID. The summarise_each function is then used to calculate the mean for each unique combination of activity and subject, with the output a "tidy", wide-format dataframe. I complete the project by using the write.table command to write this dataframe into a txt file.
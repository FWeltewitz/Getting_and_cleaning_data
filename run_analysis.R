# run_Analysis.R
#
# Creator: FWeltewitz
# Date: 25 July 2015 (**Note to self: start early next time...**)
#
# This function was written as a solution to the course project assignment of
# the "Getting Data" course, which is offered as part of the "Data Science"
# specialisation organised through Coursera.
# The instructions for the course project were as follows:
#
# One of the most exciting areas in all of data science right now is wearable 
# computing - see for example this article . Companies like Fitbit, Nike, and 
# Jawbone Up are racing to develop the most advanced algorithms to attract new 
# users. The data linked to from the course website represent data collected 
# from the accelerometers from the Samsung Galaxy S smartphone. A full 
# description is available at the site where the data was obtained: 
        
# http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

# Here are the data for the project: 
        
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

# You should create one R script called run_analysis.R that does the following. 
# - Merges the training and the test sets to create one data set.
# - Extracts only the measurements on the mean and standard deviation for each 
#   measurement. 
# - Uses descriptive activity names to name the activities in the data set
# - Appropriately labels the data set with descriptive variable names. 
# - From the data set in step 4, creates a second, independent tidy data set with 
#   the average of each variable for each activity and each subject.

run_analysis<-function(){

# I am using the dplyr package for this project        
#install.packages("dplyr")
library(dplyr)

# Read features file, which contains the variable names
df.features             <-read.table(file.path("UCI HAR Dataset","features.txt"))

# Read activity file, which contains the activity file
df.activity             <-read.table(file.path("UCI HAR Dataset","activity_labels.txt"))
colnames(df.activity)   <-c("Activity.ID","Activity") 


# For both the test and training data, the data themselves are in the "X" file,
# while the activity codes are in the "y" files. Therefore begin by column
# binding the X and y files together, to attach to each set of observations the
# activity during which the readings were taken. Then also attach the subject
# which undertook the activity, and label columns appropriately.

# Test data
df.x.test               <-read.table(file.path("UCI HAR Dataset","test","X_test.txt"))
df.y.test               <-read.table(file.path("UCI HAR Dataset","test","y_test.txt"))
df.subject.test         <-read.table(file.path("UCI HAR Dataset","test","subject_test.txt"))
df.test                 <-cbind(df.subject.test,df.y.test,df.x.test)
colnames(df.test)       <-c("Subject.ID","Activity.ID",levels(df.features[,2]))

# Training data
df.x.train              <-read.table(file.path("UCI HAR Dataset","train","X_train.txt"))
df.y.train              <-read.table(file.path("UCI HAR Dataset","train","y_train.txt"))
df.subject.train        <-read.table(file.path("UCI HAR Dataset","train","subject_train.txt"))
df.train                <-cbind(df.subject.train,df.y.train,df.x.train)
colnames(df.train)      <-c("Subject.ID","Activity.ID",levels(df.features[,2]))

# Drop columns that do not contain means or standard deviations (including those
# containing mean frequencies and the gravityMean variables in the angle measurements...
# I interpreted these as not being part of the final output)
df.test         <- df.test %>% select(matches("mean()|std()|Subject|Activity.ID")) %>% select(-matches("angle")) %>% select(-matches("meanFreq"))
df.train        <- df.train %>% select(matches("mean()|std()|Subject|Activity.ID")) %>% select(-matches("angle")) %>% select(-matches("meanFreq"))

# Now concatenate the two datasets
df              <- rbind(df.train,df.test)

# Now use dplyr again to calculate the mean for each variable by Subject-Activity combination
df.summary      <- df %>% group_by(Subject.ID,Activity.ID) %>% summarise_each(funs(mean))

# Produce the final dataframe by joining with the activity name dataframe using the 
# Activity.ID, then remove the ID from the dataframe and order it by Activity
df.summary      <- inner_join(df.activity,df.summary) 
df.summary      <- df.summary %>% select(-Activity.ID) %>% arrange(Activity)

# Now give appropriate names to the variables in the tidy data frame
newcolnames<-c(c(colnames(df.summary[1:2])),paste("Subject-mean-",colnames(df.summary[3:ncol(df.summary)]),sep=""))
colnames(df.summary)    <-newcolnames

df.summary

# Write tidy dataset into working directory as a txt file
#write.table(df.summary,"UCI_HAR_Dataset_Tidy.txt",row.names=FALSE)

}

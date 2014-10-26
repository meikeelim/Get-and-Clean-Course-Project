Getting and Cleaning Data Course Project
========================================

##Human Activity Recognition Using Smartphones Dataset
Version 1.0

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

##Features of the run_analysis.R

1. Reads the txt files using read.table.
2. Merges the training and the test sets to create one data set.
3. Using "grep" function, extracts only the measurements on the mean and standard deviation for each measurement.
4. Using the "merge" function, descriptive activity names are merge to name the activities in the data set
5. Using "melt" and the "dcast" function of the "reshape2" package, creates an independent tidy data set (final_data.txt) with the average of each variable for each activity and each subject.

##How to use run the script

1. Download data from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
2. Download run_analysis.R into UCI HAR Dataset folder.
3. Set UCI HAR Dataset folder as your working directory.
4. Install "reshape2" package. 
5. Run source "run_analysis.R".

References:
===========
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012







##set working directory to UCI HAR Dataset folder
##setwd("C:/Users/limm5/Downloads/Coursera/R Projects/UCI HAR Dataset")
library(reshape2)

## Step 1: Read and merge the training and the test sets to create one data set. 

## Read activity_labels.txt and name columns 
activity <- read.table("./activity_labels.txt",col.names=c("activity_id","activity_name"))

## Read features.txt
features <- read.table("./features.txt") ##561 by 2

##Read train and test data into table and row combine
trainData <- read.table("./train/X_train.txt") ##7352 rows by 561 columns
testData <- read.table("./test/X_test.txt") ## 2947 rows by 561 columns
mergeData <- rbind(trainData, testData) ##10299 rows by 561 columns
colnames(mergeData) <- features[,2]  ## label dataframe with colnames from features.txt

## Read the labels of the train and test data and give colname
trainLabels <- read.table("./train/Y_train.txt") ##7352 by 1
testLabels <- read.table("./test/Y_test.txt")  ##2947 by 1
mergeLabels <- rbind(trainLabels, testLabels) 
colnames(mergeLabels) <- "activity_id"

## Read the ids of the train and test subjects and give column name
trainSubject_id <- read.table("./train/subject_train.txt") ##7352 by 1
testSubject_id <- read.table("./test/subject_test.txt") ##2947 by 1
mergeSubject_id <- rbind(trainSubject_id, testSubject_id) 
colnames(mergeSubject_id) <- "subject_id"

## column combine subject_id, activity_id and data into one dataframe
df <- cbind(mergeSubject_id, mergeLabels, mergeData)

##Step 2: Extracts only the measurements on the mean and standard deviation for each measurement. 
mean_id <- grep("mean",names(df),ignore.case=TRUE)
mean_names <- names(df)[mean_id]
std_id <- grep("std", names(df), ignore.case=TRUE)
std_names <- names(df)[std_id]

df_mean_std <- df[,c("subject_id","activity_id", mean_names, std_names)] ##10299 by 88

##Step 3: Uses descriptive activity names to name the activities in the data set
mergeActivity <- merge(activity, df_mean_std, by.x="activity_id",by.y="activity_id",all=TRUE)

##Step 4: Melt the dataset and adding in descriptive activity names 
melt_data <- melt(mergeActivity,id=c("activity_id","activity_name","subject_id"))

##Step 5: Apply mean function to dataset using dcast function.
mean_data <- dcast(melt_data, activity_id + activity_name + subject_id ~ variable,mean)

##Step 6: Create a txt file
write.table(mean_data,"./final_data.txt", row.names=FALSE)

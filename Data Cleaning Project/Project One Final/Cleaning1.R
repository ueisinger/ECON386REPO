##Task One

##--Start U.Eisinger--
##Setting the correct working directory.
rm(list = ls())
getwd()
setwd()

##Importing the data from the txt files from the Econ386Repo, and saving them as objects.
XTrain <- read.table("~/Desktop/Econ386/ECON386REPO/Data Cleaning Project/Task 1/X_train.txt", quote="\"", comment.char="")
XTest <- read.table("~/Desktop/Econ386/ECON386REPO/Data Cleaning Project/Task 1/X_test.txt", quote="\"", comment.char="")
YTrain <- read.table("~/Desktop/Econ386/ECON386REPO/Data Cleaning Project/Task 1/y_train.txt", quote="\"", comment.char="")
YTest <- read.table("~/Desktop/Econ386/ECON386REPO/Data Cleaning Project/Task 1/y_test.txt", quote="\"", comment.char="")
SubjectsTrain <- read.table("~/Desktop/Econ386/ECON386REPO/Data Cleaning Project/Task 1/subject_train.txt", quote="\"", comment.char="")
SubjectsTest <- read.table("~/Desktop/Econ386/ECON386REPO/Data Cleaning Project/Task 1/subject_test.txt", quote="\"", comment.char="")

##Setting the first column that has numbers assigned to headers to null.
Headers <- read.table("~/Desktop/Econ386/ECON386REPO/Data Cleaning Project/Task 1/features.txt", quote="\"", comment.char="")
Headers[1] <- NULL

##--Start N.Kingery--
##Transposing the Header object so that the data frame changes from 1 column, 561 rows to 561 columns, 1 row. This also changes the data type to char.
newHeaders=t(Headers)

##Merging the data into the same columns and rows.
subjects <- rbind(SubjectsTrain, SubjectsTest)
XVariable <- rbind(XTrain, XTest)
YVariable <- rbind(YTrain, YTest)
XYmerge <- cbind(subjects, YVariable, XVariable)

##Changing the name of the header row to be Subjects, Activity and the strings of newHeaders.
names(XYmerge) <- c("Subjects", "Activity", newHeaders)

##--Start M.Stephens--
##Selecting columns individually with subject, activity, std, mean, and then subsetting into a new table.
library(dplyr)
subset1 <-grep("std", colnames(XYmerge), value = TRUE)
subset2 <-grep("mean", colnames(XYmerge), value = TRUE)
subset3 <- grep("Activity", colnames(XYmerge), value = TRUE)
subset4 <- grep("Subjects", colnames(XYmerge), value = TRUE)
subsetselect <-subset(XYmerge, select=c(subset4, subset3, subset1, subset2))

##Renaming the activity column so that the numbers change to the actual activity.
subsetselect$Activity[subsetselect$Activity =="1"] <- "WALKING"
subsetselect$Activity[subsetselect$Activity =="2"] <- "WALKING_UPSTAIRS"
subsetselect$Activity[subsetselect$Activity =="3"] <- "WALKING_DOWNSTAIRS"
subsetselect$Activity[subsetselect$Activity =="4"] <- "SITTING"
subsetselect$Activity[subsetselect$Activity =="5"] <- "STANDING"
subsetselect$Activity[subsetselect$Activity =="6"] <- "LAYING"

##Grouping the subjects and activities into subgroups.
subject_group <- group_by(subsetselect, Subjects, add=TRUE)
activity_group <- group_by(subject_group, Activity, add=TRUE)

##Summarizing each subject with the mean and standard deviation of each of the six activities.
finalTable <- activity_group %>% summarise_all(c("mean"))

##Used to save results as a file called tidy1.txt
write.table(finalTable, file="tidy1.txt")

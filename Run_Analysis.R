#Script assumed to be run in a directory containing the unzipped folder
#Load the data into R
trainx = read.table("UCI HAR Dataset\\train\\X_train.txt")
trainy = read.table("UCI HAR Dataset\\train\\y_train.txt")
trainsub = read.table("UCI HAR Dataset\\train\\subject_train.txt")

testx = read.table("UCI HAR Dataset\\test\\X_test.txt")
testy = read.table("UCI HAR Dataset\\test\\y_test.txt")
testsub = read.table("UCI HAR Dataset\\test\\subject_test.txt")

features = read.table("UCI HAR Dataset\\features.txt")
actlabels = read.table("UCI HAR Dataset\\activity_labels.txt")

#Consolidate subjects, feature names and activity labels into trainx; while we do so, 
#set activity labels and subjects to  factors.
names(trainx) = features$V2
trainy$V1 = factor(trainy$V1, labels = actlabels$V2)
trainx$activity = trainy$V1
trainx$subject = factor(trainsub$V1)


#repeat process for test set
names(testx) = features$V2
testy$V1 = factor(testy$V1, labels = actlabels$V2)
testx$activity = testy$V1
testx$subject = factor(testsub$V1)

#merge trainx and testx into one dataset
fulldat = rbind(trainx, testx)

#prune data down to our desired variables
#note that we escape left parantheses  in the search term to avoid accidentally 
#including meanFreq, which is not one of our desired variables.
nameList = c("subject", "activity", grep(".*mean\\(.*|.*std\\(.*", features[,2], value = TRUE))
fulldat = fulldat[nameList]

#change activity names to descriptive names
names(fulldat) = gsub("std\\(\\)", "StandardDeviation", names(fulldat))
names(fulldat) = gsub("mean\\(\\)", "Mean", names(fulldat))
names(fulldat) = gsub("^t", "time", names(fulldat))
names(fulldat) = gsub("^f", "frequency", names(fulldat))
names(fulldat) = gsub("Acc", "Accelerometer", names(fulldat))
names(fulldat) = gsub("Gyro", "Gyroscope", names(fulldat))
names(fulldat) = gsub("Mag", "Magnitude", names(fulldat))
names(fulldat) = gsub("BodyBody", "Body", names(fulldat))

#Create second, independent set with the average of each variable for each activity and each subject.
library(reshape2)
steakandcheesemelt = melt(fulldat, id.vars = c("subject", "activity"))
avgdata = dcast(steakandcheesemelt, subject + activity ~ variable, fun.aggregate = mean)

#Output file
write.table(avgdata, "UCI HAR Averages.txt", row.name=FALSE)

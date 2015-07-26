#1. Merges the training and the test sets to create one data set:
xtrain<-read.table("train/X_train.txt")
ytrain<-read.table("train/y_train.txt")
subject-train<-read.table("train/subject_train.txt")

xtest<-read.table("test/X_test.txt")
ytest<-read.table("test/y_test.txt")
subject-test<-read.table("test/subject_test.txt")

xdata<-rbind(xtrain, xtest)
ydata<-rbind(ytrain, ytest)
subject-data<-rbind(subject-train, subjecttest)

#2. Extracts only the measurements on the mean and standard deviation for each measurement:
feats<-read.table("features.txt")
m&sd<-grep("-(mean|std)\\(\\)", feats[, 2])
x_data <- x_data[, m&sd]
names(x_data)<-feats[m&sd, 2]

#3. Uses descriptive activity names to name the activities in the data set:
activity-labels<-read.table("activity_labels.txt")
ydata[, 1]<-activity-labels[ydata[, 1], 2]
names(ydata)<-"activity"

#4. Appropriately labels the data set with descriptive variable names. 
names(subject-data)<-"subject"
whole-data<-cbind(xdata, ydata, subject-data)

#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject:
average<-ddply(whole-data, (subject, activity), function(x) colMeans(x[, 1:66]))
write.table(average, "averages_data.txt", row.name=FALSE)

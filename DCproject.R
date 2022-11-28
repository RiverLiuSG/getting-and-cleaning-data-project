library(reshape)

# Read the train and test data set
# use rbind() function to create one combined data set
dat1<- read.table("./UCI HAR Dataset/train/X_train.txt")
dat2<- read.table("./UCI HAR Dataset/test/X_test.txt")
dat <- rbind(dat1, dat2)

# Read the label information 
featurelist<- read.table("./UCI HAR Dataset/features.txt")
# Name the column name with  feature list
names(dat)<- featurelist[,2]

#Retrieve the columns with "mean" or "std" only
dat_sub <- dat[grep('mean|std', names(dat))]

# Read the information of subject for train and test data set
# use rbind() function to create one combined data set
dattrsb<- read.table("./UCI HAR Dataset/train/subject_train.txt")
dattesb<- read.table("./UCI HAR Dataset/test/subject_test.txt")
datsb <-rbind(dattrsb, dattesb)

# Read the information of activity for train and test data set
# use rbind() function to create one combined data set
dattrlb<- read.table("./UCI HAR Dataset/train/y_train.txt")
dattelb<- read.table("./UCI HAR Dataset/test/y_test.txt")
datlb <-rbind(dattrlb, dattelb)

# use cbind() function to combine subject, label, data into final combined data set
# Add name for subject and activity
datfinal <- cbind(datsb, datlb, dat_sub)
colnames(datfinal)[1:2] <- c("subject", "activity")

# use factor() function to show descriptive activity name instead of number 
datfinal$activity <- factor(datfinal$activity, labels=c('walking','walking_up', 'walking_dn','sitting', 'standing', 'laying'))

# use melt() function to reshape and elongate the data frames which excludes "subject" and "activity"
melt_data <- melt(datfinal, id = c("subject","activity")) 

print("Reshaped data frame after melting:\n") 
print(melt_data)

# use cast() function ) to reshape the molten data which takes aggregate function and formula to aggregate the data accordingly. 
# This function is used to convert long format data back into some aggregated form of data based on mean() function
# The tidy data set will be average of each variable grouped by subject first followed by activity
cast_data = cast(melt_data, subject + activity ~ variable, mean) 

# Write the tiday_data into working directory
write.table(cast_data, file = "./tidy_data.txt")

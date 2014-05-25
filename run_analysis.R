# This script merges training and test datasets and further extracts only the 
# mean and standard deviation measurements. Finally, an independent tidy dataset
# with the average of each variable for each activity and subject is created. 
# =============================================================================

# Download and unzip file into working directory folder
# Read in data from unzipped files

subtrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
ytrain <- read.table("./UCI HAR Dataset/train/y_train.txt")
subtest <- read.table("./UCI HAR Dataset/test/subject_test.txt")
xtest <- read.table("./UCI HAR Dataset/test/X_test.txt")
ytest <- read.table("./UCI HAR Dataset/test/y_test.txt")
harfeatures <- read.table("./UCI HAR Dataset/features.txt", stringsAsFactors=FALSE)


# test1 combines key for subject individuals and key for activity labels
# testCombine combines test1 and dataframe with 561 variables
test1 <- cbind(subtest,ytest)
testCombine <- cbind(test1, xtest)

# same as above
train1 <- cbind(subtrain,ytrain)
trainCombine <- cbind(train1, xtrain)

# combines training dataset and test dataset
allCombine <- rbind(trainCombine, testCombine)


# Take column names from harfeatures data and tag on "Subject" and "Activity"
zname <- harfeatures[,2]
zfirst <- c("Subject","Activity")
zfinal <- c(zfirst,zname)

# Assign column names to allCombine dataframe
colnames(allCombine) <- zfinal

# Extract only the variables with mean and standard deviation measurements
allCombineSub <- allCombine[,grepl("std", harfeatures[,2], ignore.case=TRUE)|
                              grepl("mean", harfeatures[,2], ignore.case=TRUE)]

# Get column names from new subset of data
zsubname <- names(allCombineSub)


# Remove unwanted characters from column names for more descriptive names
# Substitute anything that matches within the bracket [\\()-] with ""
zsubname_new <- gsub("[\\()-]","",zsubname)

# Replace column names with new cleaned-up names
colnames(allCombineSub) <- zsubname_new


# Awesome plyr function
# 1st argument: input data frame; 2nd: group by variables; 3rd: function
# For the allCombineSub data, group by "Subject" and "Activity" and 
# get mean (average) of all variables for each activity and each subject

library(plyr)
tidydata <-ddply(allCombineSub,c("Subject","Activity"),
                 function(allCombineSub)colMeans(allCombineSub))

# Replace Activity column with descriptive activity names corresponding
# to numeric key of 1-6 noted in Activity Labels file
tidydata$Activity <- sub("1","Walking",tidydata$Activity)
tidydata$Activity <- sub("2","Walking Upstairs",tidydata$Activity)
tidydata$Activity <- sub("3","Walking Downstairs",tidydata$Activity)
tidydata$Activity <- sub("4","Sitting",tidydata$Activity)
tidydata$Activity <- sub("5","Standing",tidydata$Activity)
tidydata$Activity <- sub("6","Laying",tidydata$Activity)


# Write new tidy dataset to file in working directory
write.table(tidydata, file="tidydataoutput.txt")


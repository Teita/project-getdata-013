###########

# Course Project: Instructions

#1. Merges the training and the test sets to create one data set.
#2. Extracts only the measurements on the mean and standard deviation for each measurement. 
#3. Uses descriptive activity names to name the activities in the data set
#4. Appropriately labels the data set with descriptive variable names. 
#5. From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.

############

# Set your working directory

# Load and merge subject files
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
merged_dfs <- rbind(subject_test, subject_train)
names(merged_dfs) <- "subject"

# Load and merge the X files (VARIABLES)
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
merged_dfX <- rbind(X_test, X_train)

# Select the columns we want "mean" and "std" and discard the rest
f <- read.table("./UCI HAR Dataset/features.txt", stringsAsFactors = F)
feature_indices <- grep("mean()|std()", f$V2)
mean_std <- merged_dfX[,feature_indices]

# Name the features columns. Names to be found in the "feature.text"
names(mean_std) <- f[feature_indices, 2]

# Load and merge the y files (ACTIVITY COLUMN W LABELS)
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
merged_dfy <- rbind(y_test, y_train)

# Give descriptive names to activity labels
activities <- read.table("./UCI HAR Dataset/activity_labels.txt")
activity_labels <- merge(merged_dfy, activities, by.x = "V1", by.y = "V1")
readable_labels <- activity_labels[2]
names(readable_labels) <- "activity"

## Bind the three datasets into a single one
merged_data <- cbind(merged_dfs, mean_std, readable_labels)

# Calculate the "mean" of columns in your merged data by using the melt()
# and dcast() functions

# Install and load reshape 2 package first
if(require("reshape2")){
        print("reshape2 is loaded correctly")
} else {
        print("trying to install reshape2")
        install.packages("reshape2")
        if(require(reshape2)){
                print("reshape2 installed and loaded")
        } else {
                stop("could not install reshape2")
        }
}

Long_data <- melt(merged_data, id = c("activity", "subject"))
wide_mean_data <- dcast(Long_data, activity + subject ~ variable, mean)

# From the data set in step 4, I create an independent tidy data set 
write.table(wide_mean_data, file="./tidydataset.txt", row.names=FALSE)


library(reshape2)


# load files 
actlabels <- read.table("./activity_labels.txt")
actlabels[,2] <- as.character(actlabels[,2])
features <- read.table("./features.txt")
features[,2] <- as.character(features[,2])

# Extract data on mean and standard deviation
features2 <- grep(".*mean.*|.*std.*", features[,2])
features2.names <- features[features2,2]
features2.names = gsub('-mean', 'Mean', features2.names)
features2.names = gsub('-std', 'Std', features2.names)
features2.names <- gsub('[-()]', '', features2.names)


# Load datasets
train <- read.table("./train/X_train.txt")[features2]
trainActivities <- read.table("./train/Y_train.txt")
trainSubjects <- read.table("./train/subject_train.txt")
train <- cbind(trainSubjects, trainActivities, train)

test <- read.table("./test/X_test.txt")[features2]
testActivities <- read.table("./test/Y_test.txt")
testSubjects <- read.table("./test/subject_test.txt")
test <- cbind(testSubjects, testActivities, test)

# merge datasets and add labels
merged <- rbind(train, test)
colnames(merged) <- c("subject", "activity", features2.names)

# turn activities & subjects into factors
merged$activity <- factor(merged$activity, levels = actlabels[,1], labels = actlabels[,2])
merged$subject <- as.factor(merged$subject)

merged.melted <- melt(merged, id = c("subject", "activity"))
merged.mean <- dcast(merged.melted, subject + activity ~ variable, mean)

write.table(merged.mean, "tidy.txt", row.names = FALSE, quote = FALSE)

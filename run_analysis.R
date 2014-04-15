# Getting and Cleaning Data   project
# 
mergeXy <- function(path, Xfile, yfile, sfile){
	# merge the features of X and activity of y
	# put y in the first field
	Xda <- read.table(paste(path, "/", Xfile, sep = ""), fill = T, row.names = NULL, header = F, comment.char = "", quote = "")
	yda <- read.table(paste(path, "/", yfile, sep = ""), fill = T, row.names = NULL, header = F, comment.char = "", quote = "")
	sda <- read.table(paste(path, "/", sfile, sep = ""), fill = T, row.names = NULL, header = F, comment.char = "", quote = "")
	Xyda <- cbind(sda, yda, Xda)
	return(Xyda)
}

# Merges the training and the test sets to create one data se
trainXy <- mergeXy("train", "X_train.txt", "y_train.txt", "subject_train.txt")
testXy <- mergeXy("test", "X_test.txt", "y_test.txt", "subject_test.txt")
totalXy <- rbind(trainXy, testXy)

# Extracts only the measurements on the mean and standard deviation for each measurement
features <- read.table("features.txt", fill = T, header = F)
mean_index <- grep("-mean\\(", tolower(features[, 2]))
std_index <-grep("-std\\(", tolower(features[, 2]))
measurement_index <- sort(c(mean_index, std_index))

# Uses descriptive activity names to name the activities in the data set
tidy <- totalXy[, c(1, 2, (measurement_index + 2))]
label_extr <- as.vector(features[, 2][measurement_index])
col_names <- c('subject', 'activity_label', label_extr)
colnames(tidy) <- col_names
tidy <- tidy[order(tidy$subject, tidy$activity_label), ]

# Appropriately labels the data set with descriptive activity names
label <- read.table("activity_labels.txt", fill = T, header = F)
label <- label[, 2]
action <- as.vector(tidy[,2])
action_label <- as.vector(unlist(lapply(action, function(x) sub(x, label[x], x))))
tidy[, 2] <- action_label
write.table(tidy, 'tidy.txt', row.names = FALSE, sep = "\t", quote = F)

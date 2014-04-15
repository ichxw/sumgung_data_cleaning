Code Book for the run_analysis.R
===============================
### Merges the training and the test sets to create one data set
* mergeXy function was used to merge the subject, activity symbol, and all the 561 measurements. totally, 563 columns
* merge the training and test data seperately, and using rbind to merge the train and test set.
* the total dataset totalXy is matrix of 10299 * 563

### Extracts only the measurements on the mean and standard deviation for each measurement
* use the grep function to extract measurements with only mean and std, 66 of measuments (half mean and half std) were selected.
* reduce the 561 measurements to 66 

### Uses descriptive activity names to name the activities in the data set
* name the first two columns as subject and activity_label
* select the corresponding 66 feature names and set them as the column names of associated measurements 

### Appropriately labels the data set with descriptive activity names
* read the activity_labels file
* use the lapply functin the replace activity symbols (i.e., number 1 to 6) to activity labels with descriptive activity

### save the table as tidyData.txt
 

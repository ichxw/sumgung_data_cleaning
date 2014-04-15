sumgung_data_cleaning
=====================

##Script name run_analysis.R
* copy this R script to any unzip folder of the Sumsung data( i.e., UCI HAR Dataset)
* run the script and a file named tidyData.txt will be generated.
* the column descriptor of tidyData.txt is subject, activity_label followed by 56 measurements each with 10299 observaiton
* only measurements with clear mean and standard deviation were kept. measurements like fBodyBodyGyroJerkMag-meanFreq, angle(tBodyGyroJerkMean,gravityMean) and so on were not considered even though word "[Mm]ean" exists. 

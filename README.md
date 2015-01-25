Getting and Cleaning Data - Course Project

- This repository includes the R script code, a README.md describes
  how the script works and the codebook.md describes the variables
  for the "Getting and Cleaning data" class project. Tidydata.txt 
  is the output of the R script.
 
- The run_analysis.R script will do the following tasks:

1. Download and unzip data and data description files from 
   http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
   
2. Read the train and the test data and set them together to create
   one data set.
   
3. Extracts only the measurements on the mean and standard deviation 
   for each measurement. 
   
4. Uses descriptive activity names to name the activities in the data set

5. Labels the data set with descriptive variable names. 

6. Creates tidy data set with the average of each variable for each activity
   and each subject. Write the tidy data set to the tidydata.txt file.

- codebook.md describes the variables/data, and work that was performed 
  to clean up the data.

- tidydata.txt is the output of the run_analysis.R programming


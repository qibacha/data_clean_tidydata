###################################################################
# Download the zip file to local computer, and unzip the files to 
# a temp directory.
###################################################################

z <- tempfile() 
download.file("http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",z) 
unzip(z,exdir=tempdir()) 
unlink(z)

###################################################################
# Get the current work directory and keep it to set back after the
# data reading job is done.
###################################################################
workDirectory<-getwd() 

###################################################################
# Set the work directory to the temp directory that has the data
# unzipped
###################################################################
setwd(tempdir()) 
setwd("UCI HAR Dataset/") 

###################################################################
# Read the features file and activity lables into data.frames
###################################################################
features<-read.table("features.txt")["V2"] 
activity_labels<-read.table("activity_labels.txt")["V2"] 

###################################################################
# Assign label to a name factor
###################################################################
measure_names<-features$V2

###################################################################
# Get index of columns that have mean and std data 
###################################################################
index_mean_std<-grep("mean|std",features$V2) 

###################################################################
# Set work directory to "train". Read train X files and set the 
# column name of the x training data to the feature file value. 
###################################################################
setwd("train") 
X_train<-read.table("X_train.txt") 
names(X_train)<-measure_names 

###################################################################
# Read train Y files and set the column name of the y training data 
# to 'labels'.
################################################################### 
y_train<-read.table("y_train.txt") 
names(y_train)<-"labels" 

###################################################################
# Read train subject files and set the column name of the subject 
# training data to 'subjects'. 
################################################################### 
subject_train<-read.table("subject_train.txt") 
names(subject_train)<-"subjects" 

###################################################################
# Set work directory to "test". Read test X files and set the 
# column name of the x training data to the feature file value.  
################################################################### 
setwd("../test/") 
X_test<-read.table("X_test.txt") 
names(X_test)<-measure_names 

###################################################################
# Read test Y files and set the column name of the y training data 
# to 'labels'. 
###################################################################
y_test<-read.table("y_test.txt") 
names(y_test)<-"labels" 

###################################################################
# Read test subject files and set the column name of the subject 
# training data to 'subjects'. 
###################################################################
subject_test<-read.table("subject_test.txt") 
names(subject_test)<-"subjects" 

###################################################################
# Set the work directory back.
###################################################################
setwd(workDirectory) 

###################################################################
# Get the names of the measurements only with the mean and standard
# deviation based on the mean and standard deviation index
################################################################### 
means_and_std_colnames<-colnames(X_test)[index_mean_std] 

###################################################################
# Combine test and train data. From X_test, and X_train data, only
# the column names have mean and standard deviation will selected 
###################################################################
X_test_subset<-cbind(subject_test,y_test,subset(X_test,select=means_and_std_colnames)) 
X_train_subset<-cbind(subject_train,y_train,subset(X_train,select=means_and_std_colnames)) 

 
###################################################################
# Merge the train and the test data. 
###################################################################
All<-rbind(X_test_subset, X_train_subset) 

###################################################################
# Create tidy data set with the average of each variable for each 
# activity and each subject. Sort tidy data by subject.
################################################################### 
tidy<-aggregate(All[,3:ncol(All)],list(Subject=All$subjects, Activity=All$labels), mean) 
tidy<-tidy[order(tidy$Subject),] 

###################################################################
# Use activity names to name the activities in the data set.
###################################################################
tidy$Activity<-activity_labels[tidy$Activity,] 

###################################################################
# Output tidy out to tidydata.txt file, and use tab as the delimiters
################################################################### 


write.table(tidy, file="./tidydata.txt", sep="\t", row.names=FALSE) 
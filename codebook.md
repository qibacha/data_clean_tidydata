
Variable:

- z, points to a temp file will be used to download the data file

- exdir, points to a temp folder to store the unzipped data file

- workDirectory, points to my current working directory

- features, stores the measures read from the features.txt file

- activity_labels, stores the activity descriptions read from the 
  activity_labels.txt file
  
- measure_names, contains the measure names, will be reused

- index_mean_std, contains the column indices of the mean and 
  standard deviation measures
  
- X_train, has the data read from the X_train.txt file

- y_train, has the data read from the y_train.txt file

- subject_train, has the data from the subject_train.txt file

- X_test, has the data read from the X_test.txt file

- y_test, has the data read from the y_test.txt file

- subject_test, has the data read from the subject_test.txt file

- X_test_subset, the combined test dataset of subject_test,y_test, 
  and X_test which only has mean and standard deviation measures
  
- X_train_subset, the combined train dataset of subject_train, 
  y_train, X_train which only has mean and standard deviation measures
  
- All, the combined train and test dataset

- tidy, the average of "All" mean and standard deviation measures 
  aggregated by subject and activity

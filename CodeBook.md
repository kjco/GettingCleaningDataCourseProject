Getting and Cleaning Data
=========

Variables
----------------

####subjects####
- *subjects*: key for the individuals that attended the experiment
- *subtest*: a data frame containing the subject key associated with each test in the test group  
- *subtrain*: a data frame containing the subject key associated with each test in the training group

####activity labels####
- *y*: key for activity labels
- *ytest*: a data frame containing the activity key assoicated with each test in the test group
- *ytrain*: a data frame containing the activity key assoicated with each test in the training group

####measurements####
- *x*: key for the measurements, where each measurement corresponds to an measurement taken in the test
- *xtest*: a data frame conaining all the measurements taken in each test in the test group.
- *xtrain*: a data frame conaining all the measurements taken in each test in the training group.

Data Transformation
----------------

1. **Merge**: Merge all the data frames listed in the previous section into a single data frame with subject key as the first column, activity label as the second, followed by the columns of measurements. This new data frame is named  *allCombine*.

2. **Label Cleanup**: Remove the special characters "-" of "()"  in the column names.

3. **Renaming**: Rename the activities with descriptive names in place of the numeric keys.

4. **Selection**: Select the columns with the mean and standard deviation measurements. This new data frame is named *allCombineSub*.

5. **Tidy Data Set**: Create an independent tidy dataset with average of each measurement for each activity and each subject. This new data frame is named *tidydata*.

6. **Output File**: Output and save the new tidt data set as  a txt file named *tidydataoutput.txt*.
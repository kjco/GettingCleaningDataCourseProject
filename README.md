# Summary

The run_analysis.R script takes the data from UCI HAR Dataset (Human Activity Recognition Using Smartphones) and merges the training and the test sets to create one data set. This script further extracts only the variables with mean and standard deviation measurements, and creates an independent tidy data set with the average of each variable for each activity and each subject. 


# Setup

* Download the file from
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

* Unzip the downloaded file to the working directory to a folder called "UCI HAR Dataset". This folder will contain the following pertinent files:
  * features.txt
  * train folder
     - X_train.txt
     - subject_train.txt
     - y_train.txt
  * test folder
     - X_test.txt
     - subject_test.txt
     - y_test.txt


# Process

The run_analysis.R script will take the seven pertinent files mentioned in the setup step to output an independent tidy dataset file "tidydataoutput.txt" in the working directory.

The run_analysis.R script can be run in RStudio, Rconsole, or on the command line.
To run on the command line, type `Rscript run_analysis.R`
# getting-and-cleaning-data-
This repository contains the following files 
-Readme.md 
-CodeBook.md 
-run_Analysis.R
-tidy.txt 

The function run_Analysis.R does the following - 
Load the activity and feature info
Loads both the training and test datasets, keeping only those columns which reflect a mean or standard deviation
Loads the activity and subject data for each dataset, and merges those columns with the dataset
Merges the two datasets
Converts the activity and subject columns into factors
Creates a tidy dataset that consists of the average (mean) value of each variable for each subject and activity pair.
The end result is shown in the file tidy.txt.

Note- the working directory is the UCI HAR Database 

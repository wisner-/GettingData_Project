GettingData_Project
===================

Class project for getting and cleaning course

9/20/2014, wisner-

R script run_analysis.r

This script is for the Coursera 'Getting and Cleaning Data' course project.

Input was downloaded from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

and unzipped into the script directory in a folder named /UCI HAR Dataset/.

The script sees:
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

Processing Steps:
1 - Read in data files.  The test files:  subject_test.txt, y_test.txt, and X_test.txt
    are read first and bound column wise.  An empty column is added to store activity
    labels.  The same read and cbind action is done to the train files.
2 - Two data frames from 1 are row bound together.
3 - The columns are renamed 'Source', 'Subject_ID', 'Activity_ID', 'Activity', ...
    where ... are the names read directly from features.txt
4 - The Activity column is populated with text names according to Activity_ID,
    as defined in activity_labels.txt
5 - The result is subset to removed unwanted column and written out as tidy.txt   *
6 - The result from 5 is reshaped to calculate the mean of each variable for each 
    activity and each subject.  The result is written out as tidy_summary.txt

* Note to graders:  It was a bit unclear too me, which columns were to be included in
  the tidy data set.  The script defines the vector mean_cols to control which columns
  to include.  It can be set to c(1:6) to just get the first 6 colomns, or c(1:6,41:46,
  81:86,121:126,161:166,201:202,214:215,227:228,240:241,253:254,266:271,345:350,424:429,
  503:504,516:517,529:530,542:543,555:561) with include all mean() and std() columns.
  No other changes to the script are needed, so any vector of numbers 1-561(in any 
  order for that matter) will control the columns of tidy.txt and tidy_summary.txt

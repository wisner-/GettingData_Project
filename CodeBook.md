Code Book:

  --  tidy.txt --

Subject_ID - unique for each participant
Activity - Name of activity as defined in feature_labels.txt
Columns >= 3, as decribed above are controlled by mean_cols:  mean_cols <- c(1:6) gives:
tBodyAcc-mean()-X
tBodyAcc-mean()-Y
tBodyAcc-mean()-Z
tBodyAcc-std()-X
tBodyAcc-std()-Y
tBodyAcc-std()-Z


For more info see the input data README.txt in /UCI HAR Dataset/
 

  --  tidy_summary.txt --

Contains the mean of each variable for each activity and each subject.
So there is a set means for each Activity-Subject.

Activity - Name of activity as defined in feature_labels.txt
Subject_ID - unique for each participant
tBodyAcc-mean()-X
tBodyAcc-mean()-Y
tBodyAcc-mean()-Z
tBodyAcc-std()-X
tBodyAcc-std()-Y
tBodyAcc-std()-Z
.
.
.
Columns >= 3 are decribed above.

For more info see the input data README.txt in /UCI HAR Dataset/

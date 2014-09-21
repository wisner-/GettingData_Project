library(reshape2)
##setwd('C:/coursera/getting/proj')

READ <- FALSE
## comment out TRUE to skip reading during dev.   Should be uncommented for submission
READ <- TRUE

if (READ==TRUE) {
  s_test <- read.csv('UCI HAR Dataset/test/subject_test.txt', colClasses = 'numeric', sep = '', header = F, stringsAsFactors = F)
  y_test <- read.csv('UCI HAR Dataset/test/y_test.txt',       colClasses = 'numeric', sep = '', header = F, stringsAsFactors = F)
  x_test <- read.csv('UCI HAR Dataset/test/X_test.txt',       colClasses = 'numeric', sep = '', header = F, stringsAsFactors = F)
  
  s_train <- read.csv('UCI HAR Dataset/train/subject_train.txt', colClasses = 'numeric', sep = '', header = F, stringsAsFactors = F)
  y_train <- read.csv('UCI HAR Dataset/train/y_train.txt',       colClasses = 'numeric', sep = '', header = F, stringsAsFactors = F)
  x_train <- read.csv('UCI HAR Dataset/train/X_train.txt',       colClasses = 'numeric', sep = '', header = F, stringsAsFactors = F)
}
##create a vector of 0's to retain source of data,  0=test,  1=training
src <- seq(0, by=0, length.out=length(s_test[,1]))
act_labels <- vector('character',length(s_test[,1]))
test <- cbind(src, s_test, y_test, y_test, x_test)

src <- seq(1, by=0, length.out=length(s_train[,1]))
act_labels <- vector('character',length(s_train[,1]))
train <- cbind(src, s_train, y_train, y_train, x_train)

all <- rbind(test, train)

names <- read.csv('UCI HAR Dataset/features.txt', colClasses = 'character', sep = '', header = F)
colnames(all) <- c('Source', 'Subject_ID', 'Activity_ID', 'Activity', names[,2])

for(r in 1:length(all[,1])){
  if (all[r,3] == 1){all[r,4]<-'WALKING'}
  if (all[r,3] == 2){all[r,4]<-'WALKING_UPSTAIRS'}
  if (all[r,3] == 3){all[r,4]<-'WALKING_DOWNSTAIRS'}
  if (all[r,3] == 4){all[r,4]<-'SITTING'}
  if (all[r,3] == 5){all[r,4]<-'STANDING'}
  if (all[r,3] == 6){all[r,4]<-'LAYING'}
  next
}

## subset for output 
## Set up which columns to subset.  Not tolally clear which 'mean' and 'std' cols to use, edit to get more or less
##  This is every col with 'mean' or 'std' in name.  Numbers directly from features.txt file.  Offset applied below.
mean_cols <- c(1:6,41:46,81:86,121:126,161:166,201:202,214:215,227:228,240:241,253:254,266:271,345:350,424:429,503:504,516:517,529:530,542:543,555:561)
## this one first set of means in the features.txt file.  Use for dev. 
##mean_cols <- c(1:6) 
cols <- c(2, 4, mean_cols+4)
result <- all[,cols]

write.table(result, 'tidy.txt', quote=F, row.names=F)

rmelt <- melt(result, id=c(1,2), measure.vars=c(1:length(mean_cols)+2))
rcast <- dcast(rmelt, Activity+Subject_ID ~ variable, mean)

write.table(rcast, 'tidy_summary.txt', quote=F, row.names=F)

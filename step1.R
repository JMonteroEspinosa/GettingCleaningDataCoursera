setwd("/home/jmontero/Documents/coursera/dataCleaningR/Week4/Assignment/UCI HAR Dataset")

# import everything
max_rows <- 100
X_train <- read.table(file = "UCI HAR Dataset/train/X_train.txt", nrows = max_rows)
y_train <- read.table(file = "UCI HAR Dataset/train/y_train.txt", nrows = max_rows)
subjects_train <- read.table(file = "UCI HAR Dataset/train/y_train.txt", nrows = max_rows)
X_test <- read.table(file = "UCI HAR Dataset/test/X_test.txt", nrows = max_rows)
y_test <- read.table(file = "UCI HAR Dataset/test/y_test.txt", nrows = max_rows)


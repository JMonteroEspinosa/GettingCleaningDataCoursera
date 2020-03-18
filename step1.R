library(tibble)

setwd("/home/jmontero/Documents/coursera/dataCleaningR/Week4/Assignment_folder/GettingCleaningDataCoursera")

# import everything
max_rows <- 10000

# train sets
X_train <- read.table(file = "UCI HAR Dataset/train/X_train.txt", nrows = max_rows)
y_train <- read.table(file = "UCI HAR Dataset/train/y_train.txt", nrows = max_rows)
names(y_train) <- "activity"
subjects_train <- read.table(file = "UCI HAR Dataset/train/subject_train.txt", nrows = max_rows)
names(subjects_train) <- "subject"
# test sets
X_test <- read.table(file = "UCI HAR Dataset/test/X_test.txt", nrows = max_rows)
y_test <- read.table(file = "UCI HAR Dataset/test/y_test.txt", nrows = max_rows)
names(y_test) <- "activity"
subjects_test <- read.table(file = "UCI HAR Dataset/test/subject_test.txt", nrows = max_rows)
names(subjects_test) <- "subject"


# separately bind train and test dfs
df_train <- cbind(subjects_train, y_train, X_train)
rm(subjects_train, y_train, X_train)
df_test <- cbind(subjects_test, y_test, X_test)
rm(subjects_test, y_test, X_test)

# now append them two
df <- rbind(df_train, df_test)
rm(df_train, df_test)

df <- as_tibble(df)
# save as R object
saveRDS(df, file = "merged_data.RDS")
library(tibble)

setwd("add your directory")

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

# steps 2 to 4

library(dplyr)

setwd("/home/jmontero/Documents/coursera/dataCleaningR/Week4/Assignment_folder/GettingCleaningDataCoursera")

# bring data from STEP 1
df <- readRDS("merged_data.RDS")

# STEP 2: extract only the mean and the std of each measurement
# add feature names to dataset
feature_names <- read.table("UCI HAR Dataset/features.txt",
                            stringsAsFactors = F)
feature_names <- feature_names$V2  # getting rid of index


# change names in df
names(df)[3:dim(df)[2]] <- feature_names

# remove duplicated features
df <- df[,!duplicated(names(df))]
# select only means and stds AND subject, target
df <- df %>%
  select( "subject" | "activity" | contains(c("std", "mean"))) %>%
  # remove mean frequency
  select(-contains(c("meanFreq", "angle")))

# STEP 3: rename activities
# grab activities
# activities is a lookup-table
activities <- read.table("UCI HAR Dataset/activity_labels.txt",
                         stringsAsFactors = F)
# V1 equals current index, can drop it
activities <- activities$V2
print(activities[4])

# label target
df$activity <- factor(df$activity, labels = activities)

# STEP 4: rename variables
# create a function that applies all the transformations
clean_vars <- function(var) {
  # transformation: initial t -> empty
  var <- gsub("^t", "", var)
  # transformation: - -> _
  var <- gsub("-", "_", var)
  # transformation: Mag -> _modulo at the end
  var <- gsub("(^.*)Mag(.*$)", "\\1\\2_modulo$", var, perl = T)
  # transformation: Jerk -> jerk_ at the beginning
  var <- gsub("(^.*)Jerk(.*$)", "jerk_\\1\\2", var, perl = T)
  # transformation: remove empty parentheses
  var <- gsub("\\(\\)", "", var)
  # transformation: Gyro -> AngVelocity
  var <- gsub("Gyro", "AngVelocity", var)
  # transformation: initial f -> FFT_
  # FFT stands for Fast Fourier Transform
  var <- gsub("^f", "fft_", var)
  # BodyBody is simplified to Body
  var <- gsub("BodyBody", "Body", var)
  return(var)
}

names(df) <- sapply(names(df), clean_vars)

# save, to keep in folder
saveRDS(df, "tidy_data.RDS")

# read
tidy_df <- readRDS("tidy_data.RDS")

# group by activity and subject
summary_df <- tidy_df %>%
  group_by(subject, activity) %>%
  summarise_all(funs(mean(., na.rm=TRUE)))

write.table(summary_df, file="summary_data.txt", row.names = FALSE)
# summary_df <- summary_df %>%
#   select(subject|activity|contains("mean") & contains("Modulo"))

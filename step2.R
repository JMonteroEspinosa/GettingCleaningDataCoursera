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
  select(-contains("meanFreq"))

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
  # transformation 1: Mag -> Total
  var <- gsub("Mag", "Total", var)
  # transformation 2: initial t -> empty
  var <- gsub("^t", "", var)
  # transformation 3: remove empty parentheses
  var <- gsub("\\(\\)", "", var)
  # transformation: - -> _
  var <- gsub("-", "_", var)
  # transformation: Gyro -> AngVelocity
  var <- gsub("Gyro", "AngVelocity", var)
  # transformation: initial f -> FFT_ 
  # FFT stands for Fast Fourier Transform
  var <- gsub("^f", "FFT_", var)
  return(var)
}

names(df) <- sapply(names(df), clean_vars)




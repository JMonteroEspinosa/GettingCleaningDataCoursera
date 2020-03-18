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
# select only means and stds
df <- df %>%
  select(contains(c("std", "mean")))

# STEP 3: rename activities



# STEP 4: rename variables
## Codebook

In this codebook, all the transformations applied to the dataset to obtain
the tidy dataset are described.

### First step
The first step consisted in merging all the observations of all variables
in the same dataset. With that goal, the following files were merged:
1. UCI HAR Dataset/train/X_train.txt, UCI HAR Dataset/train/y_train.txt and
UCI HAR Dataset/train/subject_train.txt, resulting in **df_train**
2. UCI HAR Dataset/test/X_test.txt, UCI HAR Dataset/test/y_test.txt and
UCI HAR Dataset/test/subject_test.txt, resulting in **df_test**

Notice that, to make the operations quicker during testing, an additional parameter
,max_rows, was added to limit the number of rows read from the files if needed.

Finally, **df_train** and **df_test** were appended and converted
to a tibble named **df**

### Second step
The purpose of the second step is to select only the mean and standard deviation of the measures.

To do that, all the variables in the dataset are given a name. The activity and the subject
columns were named in Step 1 already. Names of the features are extracted from UCI HAR Dataset/features.txt
and assigned to the features in the same order. Duplicates are found in the features names and are dropped.

The last procedure is to restrict the dataset to the following columns:
- measures identifying activity and subject
- measures of mean ( but not meanFreq) and std 

Here I describe all the transformations applied to the dataset to obtain
the tidy dataset.


**The first step** consisted in merging all the observations of all variables
in the same dataset. With that goal, the following files were merged:
1. UCI HAR Dataset/train/X_train.txt, UCI HAR Dataset/train/y_train.txt and
UCI HAR Dataset/train/subject_train.txt, resulting in **df_train**
2. UCI HAR Dataset/test/X_test.txt, UCI HAR Dataset/test/y_test.txt and
UCI HAR Dataset/test/subject_test.txt, resulting in **df_test**

Notice that, to make the operations quicker during testing, an additional parameter
,max_rows, was added to limit the number of rows read from the files if needed.

Finally, df_train and df_test were appended and converted to a tibble.

# GettingCleaningDataCoursera
Assignment Week 4
In this README, all the transformations applied to the dataset to obtain
the tidy and the summary datasets are described.

The workflow is divided into several steps. The first four steps create a tidy dataset
from the raw data; they take as input several files described in step 1, and return as output tidy_data.RDS. The fifth step computes mean by subject and activity; it takes as input tidy_data.RDS, and returns summary_data.txt

### First step
The first step consisted in appending all the observations of all variables
in the same dataset. To put all variables together, the following files were merged:
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
- measures of mean (but not meanFreq) and std
- drop angle measures that include means

### Third step
To label the activity column, a lookup table from UCI HAR Dataset/activity_labels.txt
is extracted. As a result, activity is recast as a factor with the following labels:
1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING


### Fourth step
The fourth step deals with renaming the columns to make them more user-friendly. After this process, each feature name is made of several tags separated by underscores.

A total of eight transformations are applied to the dataset with this purpose:
- initial 't's, standing for time measures, are dropped as considered redundant
- '-' are changed by '\_' to make the separations between tags more homogeneus
- Mag, which stands for magnitude, is replaced by modulo\_ at the beginning.
- empty parentheses, indicating functions (e.g. mean()), are eliminated.
- original names with Gyro (from measures taken from a gyroscope) are replaced by the actual measure being taken, AngVelocity (Angular Velocity)
- initial 'f', indicating whether a variables has been transformed by a Fast Fourier Transformation, is replaced by the acronym fft at the beginning of the string.

Finishing this step, cleaning is over. The dataset is saved as tidy_data.RDS (which stores the dataframe as a R object)

### Fifth step
Loads tidy_data.RDS and computes the mean after grouping by subject and activity. Finally, the resulting dataframe is saved as summary_data.txt
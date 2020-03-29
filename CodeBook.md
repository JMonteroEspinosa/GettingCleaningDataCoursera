## Codebook

### Data Structure
All the rows in tidy_data.RDS correspond to an observation of an activity in a particular moment of time. Each column corresponds to a moment of a measure of the observation, i.e. mean or standard deviation.

The dataframe summary_data.txt is obtained from obtaining the mean from the previous data by subject and activity. Therefore, the rows of summary_data.txt correspond to a subject and an activity. As in tidy_data.RDS, each column corresponds to a measure. But in this case, the values correspond to the mean value of some moment of a measure (such as mean of the standard deviation of the measures in the previous data frame).

### Variables Description
Variables can be separated into variables describing the experiment and features. The former describe to whom (subject) and which activity (activity) were being observed.

Feature names follow a given structure. They contain several tags joined by underscores, where each tag has a particular meaning.

#### Measures
- BodyAcc: acceleration experimented by the body
- GravityAcc: acceleration caused by gravity
- BodyAngVelocity: angular velocity experimented by the body

#### Moments
mean and std. They represent mean and standard deviation, respectively.

#### Axis/Modulo
X, Y, Z and Modulo. The former three represent x-, y-, and z- coordinates. The last one equals to the euclidean norm of the former three.

### Optional tags: Transformations
Optionally, some tags can be added to the beginning of a name to indicate a transformation: jerk (the rate at which acceleration changes over time) and fft (Fast Fourier Transform of the measure)
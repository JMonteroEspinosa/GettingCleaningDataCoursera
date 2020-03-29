## Codebook

### Variables Description
Variables can be separated into features and variables describing the experiment. These latter variables describe to whom (subject) and what activity (activity) was being observed.

Feature names follow a given structure. They contain several tags joined by underscores, where each tag has a particular meaning.

#### Main tags
BodyAcc: acceleration experimented by the body
GravityAcc: acceleration caused by gravity
BodyAngVelocity: angular velocity experimented by the body

#### Measures
mean and std. They represent mean and standard deviation, respectively.

#### Axis/Modulo
X, Y, Z and Modulo, the first three representing measures taken in the horizontal, vertical or depth axes correspondingly. The last one is equal to the euclidean modulo of the former three.

### Optional tags: Transformations
Some tags can be added to the beginning of a name to indicate a transformation: jerk (the rate at which acceleration changes over time) and FFT (Fourier Fast Transform of the measure)
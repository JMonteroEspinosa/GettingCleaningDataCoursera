## Codebook

### Variables Description
Variables can be separated into variables describing the experiment and features. The former describe to whom (subject) and what activity (activity) were being observed.

Feature names follow a given structure. They contain several tags joined by underscores, where each tag has a particular meaning.

#### Main tags
- BodyAcc: acceleration experimented by the body
- GravityAcc: acceleration caused by gravity
- BodyAngVelocity: angular velocity experimented by the body

#### Measures
mean and std. They represent mean and standard deviation, respectively.

#### Axis/Modulo
X, Y, Z and Modulo. The former three represent x-, y-, and z- coordinates. The last one equals to the euclidean norm of the former three.

### Optional tags: Transformations
Optionally, some tags can be added to the beginning of a name to indicate a transformation: jerk (the rate at which acceleration changes over time) and FFT (Fourier Fast Transform of the measure)
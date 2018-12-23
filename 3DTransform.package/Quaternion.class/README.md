I represent general 3d rotations by using Unit-Quaternions. Unit-Quaternions are one of the best available representation for rotations in computer graphics because they provide an easy way of doing arithmetic with them and also because they allow us to use spherical linear interpolation (so-called "slerps") of rotations.

Indexed Variables:
	a	<Float>	the real part of the quaternion
	b	<Float>	the first imaginary part of the quaternion
	c	<Float>	the second imaginary part of the quaternion
	d	<Float>	the third imaginary part of the quaternion


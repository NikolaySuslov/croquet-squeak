accessing
boundSphere

	" This will return a render bounds object if one exists. This is a TBoundSphere (location + radius), which is used to determine if a particular object is inside the clipping planes or for collision detection tests. Otherwise, the object will be assumed to have a local coordinate location of 0,0,0 and a radius of 1.0."
	^ nil.


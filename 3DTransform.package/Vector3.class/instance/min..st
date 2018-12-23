vector functions
min: aVector
	^Vector3 
		x: (self x min: aVector x)
		y: (self y min: aVector y)
		z: (self z min: aVector z)
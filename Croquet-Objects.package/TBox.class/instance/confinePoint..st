comparing
confinePoint: aVector3

	"If the point is in the box, return it.
	 Otherwise, return a new near the point, but within the box."

	(self pointInBox: aVector3) ifTrue: [
		^ aVector3
	].

	^ Vector3	x: (aVector3 x min: maxCorner x max: minCorner x)
				y: (aVector3 y min: maxCorner y max: minCorner y)
				z: (aVector3 z min: maxCorner z max: minCorner z).
	
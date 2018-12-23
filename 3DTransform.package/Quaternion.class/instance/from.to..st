initialize
from: startVector to: endVector
	"Create a rotation from startVector to endVector.  Vectors should be normalized first.  Note: doesn't work when vectors are 180 degrees to each other."
	| axis cos sin |
	startVector = endVector ifTrue: [^ self setIdentity].

	axis := startVector cross: endVector.
	cos := ((1 + (startVector dot: endVector)) / 2) sqrt.	"half-angle relation"
	sin := cos isZero 
				ifTrue: [
					"180 degree rotation"
					^ self angle: 180 axis: (Vector3 perpendicularTo: startVector)]
				ifFalse: [axis length / 2 / cos].			"double angle relation"
	axis safelyNormalize.
	self a: cos b: axis x * sin c: axis y * sin d: axis z * sin. 
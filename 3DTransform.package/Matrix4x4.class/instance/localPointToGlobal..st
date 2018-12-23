transforming
localPointToGlobal: aVector
	"Multiply aVector (temporarily converted to 4D) with the receiver"
	| x y z rx ry rz rw |
	<primitive: 'primitiveTransformVector3' module: 'CroquetPlugin'>

	x := aVector x.
	y := aVector y.
	z := aVector z.

	rx := (x * self a11) + (y * self a12) + (z * self a13) + self a14.
	ry := (x * self a21) + (y * self a22) + (z * self a23) + self a24.
	rz := (x * self a31) + (y * self a32) + (z * self a33) + self a34.
	rw := (x * self a41) + (y * self a42) + (z * self a43) + self a44.

	^Vector3 x:(rx/rw) y: (ry/rw) z: (rz/rw)
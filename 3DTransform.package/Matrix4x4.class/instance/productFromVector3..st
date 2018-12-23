double dispatching
productFromVector3: aVector3
	"Multiply aVector (temporarily converted to 4D) with the receiver"
	| x y z rx ry rz rw |
	x := aVector3 x.
	y := aVector3 y.
	z := aVector3 z.

	rx := (x * self a11) + (y * self a21) + (z * self a31) + self a41.
	ry := (x * self a12) + (y * self a22) + (z * self a32) + self a42.
	rz := (x * self a13) + (y * self a23) + (z * self a33) + self a43.
	rw := (x * self a14) + (y * self a24) + (z * self a34) + self a44.

	^Vector3 x:(rx/rw) y: (ry/rw) z: (rz/rw)
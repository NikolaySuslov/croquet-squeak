double dispatching
productFromVector4: aVector4
	"Multiply aVector with the receiver"
	| x y z w rx ry rz rw |
	x := aVector4 x.
	y := aVector4 y.
	z := aVector4 z.
	w := aVector4 w.

	rx := (x * self a11) + (y * self a21) + (z * self a31) + (w * self a41).
	ry := (x * self a12) + (y * self a22) + (z * self a32) + (w * self a42).
	rz := (x * self a13) + (y * self a23) + (z * self a33) + (w * self a43).
	rw := (x * self a14) + (y * self a24) + (z * self a34) + (w * self a44).

	^Vector4 x:rx y: ry z: rz w: rw
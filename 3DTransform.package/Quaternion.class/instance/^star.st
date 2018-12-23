arithmetic
* aRotation
	"Multiplying two rotations is the same as concatenating the two rotations."
	| v1 v2 v3 vv |
	v1 := self bcd * aRotation a.
	v2 := aRotation bcd * self a.
	v3 := aRotation bcd cross: self bcd.
	vv := v1 + v2 + v3.
	^Quaternion
		a: (self a * aRotation a) - (self bcd dot: aRotation bcd)
		b: vv x
		c: vv y
		d: vv z
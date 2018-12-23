arithmetic
reversed
	"Negating a quaternion is the same as reversing the angle of rotation"
	^Quaternion
		a: self a negated
		b: self b
		c: self c
		d: self d
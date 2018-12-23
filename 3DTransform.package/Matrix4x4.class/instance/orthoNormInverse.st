transforming
orthoNormInverse
	| m x y z rx ry rz |
	<primitive: 'primitiveOrthoNormInverseMatrix' module: 'CroquetPlugin'>
	m := self shallowCopy.
	"transpose upper 3x3 matrix"
	m a11: self a11; a12: self a21; a13: self a31.
	m a21: self a12; a22: self a22; a23: self a32.
	m a31: self a13; a32: self a23; a33: self a33.
	"Compute inverse translation vector"
	x := self a14.
	y := self a24.
	z := self a34.
	rx := (x * m a11) + (y * m a12) + (z * m a13).
	ry := (x * m a21) + (y * m a22) + (z * m a23).
	rz := (x * m a31) + (y * m a32) + (z * m a33).

	m a14: 0.0-rx; a24: 0.0-ry; a34: 0.0-rz.
	^m
" Used to be:
	m := self clone.
	v := m translation.
	m translation: Vector3 zero.
	m := m transposed.
	v := (m localPointToGlobal: v) negated.
	m translation: v.
	^ m.
"
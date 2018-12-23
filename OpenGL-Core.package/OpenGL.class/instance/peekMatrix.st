accessing
peekMatrix

	| matrix |
	matrix := Matrix4x4 new.
	self glGetFloatv: GLModelviewMatrix with: matrix.
	^ matrix.
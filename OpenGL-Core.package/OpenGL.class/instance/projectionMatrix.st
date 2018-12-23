accessing
projectionMatrix
	| matrix |
	matrix := Matrix4x4 new.
	self glGetFloatv: GLProjectionMatrix with: matrix.
	^matrix transposed
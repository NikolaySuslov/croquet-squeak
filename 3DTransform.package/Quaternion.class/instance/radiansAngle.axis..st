initialize
radiansAngle: anAngle axis: aVector3

	| angle sin cos |
	angle := anAngle / 2.0.
	cos := angle cos.
	sin := angle sin.
	self a: cos b: aVector3 x * sin c: aVector3 y * sin d: aVector3 z * sin.
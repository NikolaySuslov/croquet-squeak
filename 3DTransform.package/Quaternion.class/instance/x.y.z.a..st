initialize
x: xValue y: yValue z: zValue a: anAngle

	| angle sin cos |
	angle := (anAngle degreesToRadians) / 2.0.
	cos := angle cos.
	sin := angle sin.
	self a: cos b: xValue * sin c: yValue * sin d: zValue * sin
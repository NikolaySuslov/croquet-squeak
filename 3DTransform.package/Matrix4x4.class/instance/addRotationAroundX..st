accessing
addRotationAroundX: anAngle

	| rtrans res |
	rtrans := Matrix4x4 identity.
	rtrans rotationAroundX: anAngle.
	res := Matrix4x4 new.
	self privateTransformMatrix: self with: rtrans into: res.
	self replaceFrom: 1 to: 16 with: res startingAt: 1.

accessing
pitchYawRoll: ypr
	"Assume the receiver describes an orthonormal 3x3 matrix"
	| offset mx my mz |
	offset := self translation.
	mx := self class identity rotationAroundX: ypr x.
	my := self class identity rotationAroundY: ypr y.
	mz := self class identity rotationAroundZ: ypr z.
	self loadFrom: mz * my * mx.
	self translation: offset

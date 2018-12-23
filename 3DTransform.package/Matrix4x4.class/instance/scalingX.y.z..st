accessing
scalingX: xValue y: yValue z: zValue

	self a11: self a11 * xValue.
	self a22: self a22 * yValue.
	self a33: self a33 * zValue.
	^self
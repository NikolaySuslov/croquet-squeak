accessing
targetExtent: ext
	targetExtent := ext.
	mouseOver := false.
	self aspect: ext y / ext x asFloat.
	self extent: ext * 0.01.
	self uvScale: (ext / ext asLargerPowerOfTwo) asFloatPoint.

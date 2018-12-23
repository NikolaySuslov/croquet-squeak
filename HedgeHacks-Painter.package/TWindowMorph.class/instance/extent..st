geometry
extent: aPoint
	| textureExtent |
	super extent: aPoint.
	texture ifNil:[^self].
	textureExtent := self extent asLargerPowerOfTwo.
	textureExtent = texture textureForm extent ifFalse:[texture := nil].
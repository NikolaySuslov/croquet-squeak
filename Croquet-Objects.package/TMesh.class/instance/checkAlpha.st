initialize
checkAlpha

	opaque := false.
	alpha := false.
	1 to: faceGroups size by: 2 do:[:i |
		((materialList at:(faceGroups at: i)) hasAlpha) ifTrue: [ self setAlpha: true. ] ifFalse:[ self opaque: true.].
		].
	boundMaterial ifNotNil:[self setAlpha: true].
transform
globalPosition: gp
	self translation: (frameParent ifNil:[gp] ifNotNil:[frameParent globalToLocal: gp]).
	
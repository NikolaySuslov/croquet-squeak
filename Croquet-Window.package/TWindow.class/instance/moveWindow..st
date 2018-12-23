actions
moveWindow: event

	| delta  pointer |
	pointer := event makePointer.
	(pointer frame: self pickPlane: selectedPoint normal: cameraNorm) ifTrue:[
		delta := selectedPoint - pointer selectedPoint.
		self translation: (self translation - (self orientation localPointToGlobal: delta)).
		^ true.].
	^ false.
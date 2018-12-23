actions
doDrag: event

	| pointer delta |
	pointer := event makePointer.
	(pointer frame: self pickPlane: selectedPoint normal: cameraNorm) ifTrue:[
		delta := selectedPoint - pointer selectedPoint.
		self translation: (self translation - (self orientation localPointToGlobal: delta)).
	]. 

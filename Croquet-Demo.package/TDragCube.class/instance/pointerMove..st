events
pointerMove: event

	| delta  pointer |
	pointer := event makePointer.
	(pointer frame: self pickPlane: selectedPoint normal: norm) ifTrue:[
		delta := selectedPoint - pointer selectedPoint.
		self translation: self translation - delta.
	].

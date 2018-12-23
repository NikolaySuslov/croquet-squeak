events
pointerMove: event
	| pointer delta |
	event selection frame == labelFrame ifTrue:[
		pointer := event makePointer.
		(pointer frame: self pickPlane: selectedPoint normal: cameraNorm) ifTrue:[
			delta := selectedPoint - pointer selectedPoint.
			self translation: (self translation - (self orientation localPointToGlobal: delta)).
		].
	].
	event selection frame == #menuTxtr ifTrue:[self pointerOver: event].
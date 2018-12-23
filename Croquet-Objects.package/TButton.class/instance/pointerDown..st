events
pointerDown: event 

	self color: TButton downColor.
	frame2 ifNotNil:[
		switch ifNotNil:[
			frame solidVisibleTree: switch not.
			frame2 solidVisibleTree: switch.
			] ifNil:[
			frame solidVisibleTree: false.
			frame2 solidVisibleTree: true.
			].
		].
	pointerOnTop := true.
	whileDown ifTrue:[self startWhileDown: event.].
	self pointerMove: event.
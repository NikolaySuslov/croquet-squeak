events
pointerMove: event

	| pointer |
	pointer :=  event makePointer.
	(pointer pointerPickTree: self) ifTrue:[ 
		pointerOnTop := true.
		self color: TButton downColor.
		switch ifNotNil:[
			frame solidVisibleTree: switch.
			frame2 solidVisibleTree: switch not.
		] ifNil:[
			frame2 ifNotNil:[
				frame solidVisibleTree: false.
				frame2 solidVisibleTree: true. 
			].
		].
	] ifFalse:[ 
		pointerOnTop := false.
		self color: TButton hiliteColor. 
		switch ifNotNil:[
			frame solidVisibleTree: switch not.
			frame2 solidVisibleTree: switch.
		] ifNil:[
			frame2 ifNotNil:[
				frame solidVisibleTree: true.
				frame2 solidVisibleTree: false. 
			].
		].
	].

events
pointerUp: event
	| pointer |

	pointer := event makePointer.

	(pointer pointerPickTree: self) ifTrue:[
		switch ifNotNil:[
			self switch: switch not.
			switch 
				ifTrue:[self fire: action target: target with: event]
				ifFalse:[self fire: action2 target: target2 with: event]
		] 
		ifNil:[
			target ifNotNil:[self fire: action target: target with: event].
			frame solidVisibleTree: true.
			frame2 ifNotNil:[ frame2 solidVisibleTree: false.].
			].
		] ifFalse:[
			switch ifNotNil:[
				frame solidVisibleTree: switch not.
				frame2 solidVisibleTree: switch.
			]ifNil:[
				frame solidVisibleTree: true.
				frame2 ifNotNil:[ frame2 solidVisibleTree: false.].
			].
		].
	self color: (persist ifTrue:[TButton overColor] ifFalse:[TButton normColor]).
	pointerOnTop := false.
	whileDown ifTrue:[self stopWhileDown.].
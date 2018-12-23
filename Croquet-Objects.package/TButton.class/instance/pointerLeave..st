events
pointerLeave: event 

	self disable.
	self color: (persist ifTrue:[TButton overColor] ifFalse:[TButton normColor]).
	spin ifTrue:[
		doSpin > -180 ifTrue:[
			deltaSpin := deltaSpin negated.].
		].
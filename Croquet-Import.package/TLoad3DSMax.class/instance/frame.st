accessing
frame

	frame class = TMesh ifTrue:[^ frame.].
	frame frameChildren ifNotNil:[
		frame frameChildren size = 1 ifTrue:[ ^ frame frameChildren at: 1. ].].
	^ frame.
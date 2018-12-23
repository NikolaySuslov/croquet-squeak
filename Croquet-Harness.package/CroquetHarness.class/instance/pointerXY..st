event handling
pointerXY: pxy

	ogl ifNil:[^self].
	eventPointer localTransform: (ogl camera pointerXY: pxy).
	avatar speedControl: (bounds center - pxy) / (bounds extent * 0.5) 
			pointer:  eventPointer redButton: redButtonPressed.

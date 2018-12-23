actions
doEdge: pointer

	shiftPressed ifTrue:[^ false.]
	ifFalse:[^ self rotateBox: pointer.].
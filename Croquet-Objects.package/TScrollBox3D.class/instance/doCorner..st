actions
doCorner: pointer

	(pointer frame: selectedFrame pickPlane: selectedPoint normal: (Vector3 x:0 y:0 z: 1)) 
	ifTrue:[
		shiftPressed ifTrue:[^ self scaleBox: pointer.]
		ifFalse:[^ self moveBox: pointer.].
		].
	^ false.
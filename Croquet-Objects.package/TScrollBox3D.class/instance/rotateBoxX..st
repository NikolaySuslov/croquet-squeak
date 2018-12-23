actions
rotateBoxX: pointer

	| len delta deltaLoc spto spfrom theta trans |
	" Rotate around the x-axis "

	len := 100.
	(pointer frame: self pickRightCylinderFrom: ( Vector3 x: len  y: 0 z: 0)
		to:( Vector3 x: len negated y: 0 z: 0) radius: radius) 
	ifFalse:["we are not on the cylinder anymore...."
		delta := 2*radius.
		(pointer framePointer row2 dot: (pointer framePosition))  > 0 
			ifFalse:[  delta := delta negated.].
		deltaLoc := pointer framePointer row2 * delta.
		(pointer frame: self pickRightCylinderFrom: (Vector3 x: len  y: deltaLoc y z: deltaLoc z)
			to: ( Vector3 x: len negated y: deltaLoc y z: deltaLoc z) radius: radius)
				ifFalse:[lastSpin := nil. ^ false.].
		spto := pointer selectedPoint copy- deltaLoc.
		spto x: 0
			y: spto y negated
			z: spto z negated.
			]
	ifTrue: [spto := pointer selectedPoint copy.].
	rotPoint ifNil:[
		rotPoint := spto. 
		(rotPoint - boxPoint) length >0.01 ifTrue:[rotateDirection := -1.0.] ifFalse:[rotateDirection := 1.0.].
	].
	spfrom := rotPoint copy.
	spfrom x: 0.0.
	spfrom normalize.
	spto x: 0.0.
	spto normalize.
	theta := ((spfrom y * spto z) - (spto y * spfrom z))"/selectedRadiusSquared".
	theta < -1.0 ifTrue:[theta:= -1.0].
	theta > 1.0 ifTrue:[theta := 1.0].
	theta := theta arcSin radiansToDegrees/2.0.
	lastSpin := Matrix4x4 identity rotationAroundX: theta.

	trans := self translation.
	self translationX: 0.0 y:0.0 z:0.0.
	self localTransform: (self localTransform composeWith: lastSpin).
	self translation: trans.
	^ true.

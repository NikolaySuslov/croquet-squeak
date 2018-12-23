actions
rotateBoxY: pointer

	| trans spfrom spto deltaLoc theta len delta |
		" Rotate around the y-axis "

		len := 100.0.
		(pointer frame: self pickRightCylinderFrom: ( Vector3 x: 0.0 y: len z: 0.0)
				to: (Vector3 x: 0.0 y: len negated z: 0.0) radius: radius)
			ifFalse: [ "we are not on the cylinder anymore...."
			delta := 2*radius.
			(pointer framePointer row1 dot: (pointer framePosition)) > 0
				ifFalse:[ delta := delta negated ].
			deltaLoc := pointer framePointer row1 * delta.
			(pointer frame: self pickRightCylinderFrom: (Vector3 x: deltaLoc x y: len z: deltaLoc z )
				to: (Vector3 x: deltaLoc x y: len negated z: deltaLoc z) radius: radius)
				ifFalse:[lastSpin := nil. ^ false.].
			spto := pointer selectedPoint copy- deltaLoc.
			spto x: spto x negated
				y: 0
				z: spto z negated.
			]
	ifTrue: [spto := pointer selectedPoint copy.].
	rotPoint ifNil:[
		rotPoint := spto. 
		(rotPoint - boxPoint) length >0.01 ifTrue:[rotateDirection := -1.0.] ifFalse:[rotateDirection := 1.0.].
	].

	spfrom := rotPoint copy.
	spfrom y: 0.0.
	spfrom normalize.
	spto y: 0.0.
	spto normalize.
	theta := ((spfrom z * spto x) - (spto z * spfrom x))"/selectedRadiusSquared".
	theta < -1.0 ifTrue:[theta:= -1.0].
	theta > 1.0 ifTrue:[theta := 1.0].
	theta := theta arcSin radiansToDegrees/2.0.
	lastSpin := Matrix4x4 identity rotationAroundY: theta.

	trans := self translation.
	self translationX: 0.0 y:0.0 z:0.0.
	self localTransform: (self localTransform composeWith: lastSpin).
	self translation: trans.
	^ true.

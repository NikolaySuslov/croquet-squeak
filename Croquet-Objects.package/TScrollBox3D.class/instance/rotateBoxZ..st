actions
rotateBoxZ: pointer

	| delta trans spfrom spto deltaLoc theta len |
		" Rotate around the z-axis "

		len := 100.0.
		(pointer frame: self pickRightCylinderFrom: (Vector3 x: 0.0 y: 0.0 z: len)
				to: (Vector3 x: 0.0 y: 0.0 z: len negated) radius: radius)
			ifFalse: [ "we are not on the cylinder anymore...."
			delta := 2*radius.
			(pointer framePointer row2 dot: (pointer framePosition))  > 0 
				ifFalse:[  delta := delta negated. ].
			deltaLoc := pointer framePointer row2 * delta.
			(pointer frame: self pickRightCylinderFrom: (Vector3 x: deltaLoc x y: deltaLoc y z: len)
				to: (Vector3 x: deltaLoc x y: deltaLoc y z: len negated) radius: radius)
				ifFalse:[lastSpin := nil. ^ false.].
			spto := pointer selectedPoint copy- deltaLoc.
			spto x: spto x negated
				y: spto y negated
				z: 0.
			]
	ifTrue: [spto := pointer selectedPoint copy.].

	rotPoint ifNil:[
		rotPoint := spto. 
		(rotPoint - boxPoint) length >0.01 ifTrue:[rotateDirection := -1.0.] ifFalse:[rotateDirection := 1.0.].
	].
	spfrom := rotPoint copy.
	spfrom z: 0.0.
	spfrom normalize.
	spto z: 0.0.
	spto normalize.
	theta := ((spfrom x * spto y) - (spto x * spfrom y))"/selectedRadiusSquared".
	theta < -1.0 ifTrue:[theta:= -1.0].
	theta > 1.0 ifTrue:[theta := 1.0].
	theta := theta arcSin radiansToDegrees/2.0.
	lastSpin := Matrix4x4 identity rotationAroundZ: theta.

	trans := self translation.
	self translationX: 0.0 y:0.0 z:0.0.
	self localTransform: (self localTransform composeWith: lastSpin).
	self translation: trans.
	^ true.

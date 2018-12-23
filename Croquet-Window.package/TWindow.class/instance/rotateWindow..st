actions
rotateWindow: event

	| delta trans spfrom spto deltaLoc theta pointer |
		" Rotate around the y-axis "
	spinTime := self now asFloat - lastTime.
	lastTime := self now asFloat.
	pointer := event makePointer.
		(pointer frame: self pickRightCylinderFrom: (Vector3 x: 0.0 y: 100.0 z: 0.0)
				to: (Vector3 x: 0.0 y: -100.0 z: 0.0) radius: selectedRadius)
			ifFalse: [ "we are not on the cylinder anymore...."
			delta := 2*selectedRadius.
			(pointer framePointer row1 dot: (pointer framePosition))  > 0 
				ifFalse:[  delta := delta negated.].
			deltaLoc := pointer framePointer row1 * delta.
			(pointer frame: self pickRightCylinderFrom: (Vector3 x: deltaLoc x y: 100.0 z: deltaLoc z)
				to: (Vector3 x: deltaLoc x y: -100.0 z: deltaLoc z) radius: selectedRadius)
				ifFalse:[lastSpin := nil. ^ false.].
			spto := pointer selectedPoint copy- deltaLoc.
			spto x: spto x negated
				y: 0
				z: spto z negated.
			]
	ifTrue: [spto := pointer selectedPoint copy.].

	spfrom := selectedPoint copy.
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
	self localTransform: localTransform shallowCopy.
	^ true.

actions
doSpin: event

	| pointer |
	pointer := event makePointer.
	pointer frame: self pickSphere: Vector3 new radiusSquared: selectedRadiusSquared.
	pointer selectedPoint ifNotNil:[
		lastSpin := (self rotFromBallPoints: selectedPoint to: pointer selectedPoint) asMatrix4x4.
	].
	lastSpin ifNotNil:[self orientation: (self localTransform composeWith: lastSpin).].


transform
addRotationAroundZ: anAngle

	localTransform addRotationAroundZ: anAngle.
	self frameChanged.
	^ localTransform.
transform
addRotationAroundX: anAngle

	localTransform addRotationAroundX: anAngle.
	self frameChanged.
	^ localTransform.
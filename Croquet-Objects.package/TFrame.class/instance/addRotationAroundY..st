transform
addRotationAroundY: anAngle

	localTransform addRotationAroundY: anAngle.
	self frameChanged.
	^ localTransform.
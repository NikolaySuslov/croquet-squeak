transform
rotationAroundY: anAngle

	| trans |
	trans := self translation.
	localTransform  := Matrix4x4 identity rotationAroundY: anAngle.
	self translation: trans.
	self frameChanged.
	^ localTransform.
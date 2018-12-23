transform
rotationAroundX: anAngle

	| trans |
	trans := self translation.
	localTransform := Matrix4x4 identity rotationAroundX: anAngle.
	self translation: trans.
	self frameChanged.
	^ localTransform.
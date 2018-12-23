transform
rotationAroundZ: anAngle

	| trans |
	trans := self translation.
	localTransform := Matrix4x4 identity rotationAroundZ: anAngle.
	self translation: trans.
	self frameChanged.
	^ localTransform.
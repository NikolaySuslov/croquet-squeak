transform
rotation: anAngle around: aVector3

	| trans |
	trans := self translation.
	localTransform  := Matrix4x4 identity rotation: anAngle around: aVector3.
	self translation: trans.
	self frameChanged.
	^ localTransform.
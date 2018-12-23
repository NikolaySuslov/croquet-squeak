transform
rotation: anAngle aroundX: xValue y: yValue z: zValue

	| trans |
	trans := self translation.
	localTransform  := Matrix4x4 identity rotation: anAngle aroundX: xValue y: yValue z: zValue.
	self translation: trans.
	self frameChanged.
	^ localTransform.
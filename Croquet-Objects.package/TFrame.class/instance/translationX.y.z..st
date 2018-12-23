transform
translationX: xValue y: yValue z: zValue
	
	localTransform translationX: xValue y: yValue z: zValue.
	self frameChanged.
	^ localTransform.



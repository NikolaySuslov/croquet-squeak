transform
translation: aVector

	localTransform translation: aVector.
	self frameChanged.
	^ localTransform.

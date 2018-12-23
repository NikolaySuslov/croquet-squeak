enterExit
lookAtCamera: cam

	| delta |
	delta := cam globalTransform translation - self globalTransform translation.
	(delta dot: self lookAt)>0 ifTrue:[
		self cameraDistance: delta squaredLength.
		^ true.
	].
	^ false.
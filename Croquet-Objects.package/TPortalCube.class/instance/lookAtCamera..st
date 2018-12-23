accessing
lookAtCamera: cam

	| delta |
	delta := cam globalTransform translation - self globalTransform translation.
	self cameraDistance: delta squaredLength.
	^ true.

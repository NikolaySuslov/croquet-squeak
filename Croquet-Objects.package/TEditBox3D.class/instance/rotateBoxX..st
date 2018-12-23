actions
rotateBoxX: pointer

	super rotateBoxX: pointer.
	ghostFrame ifNotNil:[
		contents localTransform: (self localTransform composeWith: ghostChild localTransform).
		].

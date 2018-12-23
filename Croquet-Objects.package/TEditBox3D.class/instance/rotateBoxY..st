actions
rotateBoxY: pointer

	super rotateBoxY: pointer.
	ghostFrame ifNotNil:[
		contents localTransform: (self localTransform composeWith: ghostChild localTransform).
		].

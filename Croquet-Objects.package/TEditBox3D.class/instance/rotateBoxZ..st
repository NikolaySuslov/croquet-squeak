actions
rotateBoxZ: pointer

	super rotateBoxZ: pointer.
	ghostFrame ifNotNil:[
		contents localTransform: (self localTransform composeWith: ghostChild localTransform).
		].

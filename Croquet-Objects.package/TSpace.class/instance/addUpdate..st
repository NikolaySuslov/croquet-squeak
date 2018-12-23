rootService
addUpdate: frame

	updateFrames ifNotNil:[
		updateFrames do:[ :uf | uf update. ].
		updateFrames := nil.
	].
accessing
colorize: col

	self materialList do:[ :ml |
		ml colorize: col.
		ml textureMode: GLModulate.
	].
	self checkAlpha.
	frameChildren ifNotNil:[frameChildren do:[ :fc | fc colorize: col].].
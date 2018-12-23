accessing
transparency: trans

	self materialList do:[ :ml |
		ml transparency: trans.
		].
	self checkAlpha.
	frameChildren ifNotNil:[frameChildren do:[ :fc | fc transparency: trans].].
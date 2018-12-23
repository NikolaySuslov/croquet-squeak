accessing
parentChanged: frame

	" Does nothing, just forward on to children."
	frameChildren ifNotNil:[frameChildren do:[:fc | fc parentChanged: frame].].
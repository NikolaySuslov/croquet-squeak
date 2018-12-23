accessing
boundsDepth: depth

	frameChildren ifNotNil:[
		frameChildren do:[:fc | fc boundsDepth: depth].].
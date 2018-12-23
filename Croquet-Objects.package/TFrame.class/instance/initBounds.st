initialize
initBounds
	frameChildren ifNotNil:[
		frameChildren do:[:fc | fc initBounds].].
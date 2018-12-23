accessing
transparency: trans
	
	frameChildren ifNotNil:[
		frameChildren do:[ :fc | fc transparency: trans].].
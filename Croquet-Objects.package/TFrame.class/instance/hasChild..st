hierarchy
hasChild: child

	frameChildren ifNotNil:[
		frameChildren do:[:fc | 
			fc = child ifTrue:[^ true ].].].
	^ false.

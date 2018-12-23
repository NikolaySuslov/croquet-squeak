accessing
visibleTree

	self visible ifTrue:[^ true].
	frameChildren ifNotNil:[
		frameChildren do:[ :fc | fc visibleTree ifTrue:[^ true].].].
	^ false.
accessing
find: blockTest into: list

	frameChildren ifNotNil:[ 
		frameChildren do:[ :fc | fc find: blockTest into: list].].
	(blockTest value: self) ifTrue:[ list add: self].

initialize
findContentFileName: fName

	| path file |
	path := FileDirectory default fullNameFor: fName.
	(FileStream isAFileNamed: path) ifTrue:[^path].
	file := FileDirectory localNameFor: path.
	path := FileDirectory pathFromURI: 'Content/', file.
	(FileStream isAFileNamed: path) ifTrue:[^path].
	^ nil.
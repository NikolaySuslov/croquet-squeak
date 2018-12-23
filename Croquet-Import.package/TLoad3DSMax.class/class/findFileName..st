class initialization
findFileName: fName

	| path |
	(FileStream isAFileNamed: fName) ifTrue:[^ fName].
	path := FileDirectory pathFromURI: fName.
	(FileStream isAFileNamed: path) ifTrue:[^path].
	path := FileDirectory pathFromURI: 'Content/', fName.
	(FileStream isAFileNamed: path) ifTrue:[^path].
	^ nil.
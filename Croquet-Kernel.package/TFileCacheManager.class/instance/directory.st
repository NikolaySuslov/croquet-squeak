accessing
directory
	| dir |
	dir := FileDirectory on: (FileDirectory default pathFromURI: location).
	dir assureExistence.
	^dir
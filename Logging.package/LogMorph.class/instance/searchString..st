accessing
searchString: aString
	searchString := aString.
	self changed: #searchString.
	self changed: #filteredMessages
accessing
printOn: aStream
	super printOn: aStream.
	aStream nextPutAll: '('; nextPutAll: (name ifNil:[uid]) asString; nextPutAll: ')'.
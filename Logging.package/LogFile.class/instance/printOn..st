printing
printOn: aStream
	super printOn: aStream.
	file ifNil: [^ self].
	aStream nextPutAll: ' on '; nextPutAll: file localName
printing
printOn: aStream
	super printOn: aStream.
	aStream nextPut:$(;
		nextPutAll: refClass name;
		nextPut: $).
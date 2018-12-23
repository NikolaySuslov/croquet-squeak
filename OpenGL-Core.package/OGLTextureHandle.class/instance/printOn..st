printing
printOn: aStream
	super printOn: aStream.
	aStream nextPutAll:'('; print: glID; nextPutAll:', '; print: scaledSize; nextPutAll:', '; print: timeStamp; nextPutAll:')'.
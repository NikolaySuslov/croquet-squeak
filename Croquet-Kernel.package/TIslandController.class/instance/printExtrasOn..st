printing
printExtrasOn: aStream
	aStream nextPut:$(.
	aStream nextPutAll: status asString.
	aStream nextPut:$).

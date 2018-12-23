printing
printOn: aStream
	aStream nextPutAll: 'OID:['.
	aStream nextPutAll: self hex.
	aStream nextPut: $].
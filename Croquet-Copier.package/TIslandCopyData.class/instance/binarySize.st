accessing
binarySize
	^4 "id" + 4 "class-id" + 4 "indexed-size" +
		(binary ifNil:[self size*4] ifNotNil:[binary byteSize])
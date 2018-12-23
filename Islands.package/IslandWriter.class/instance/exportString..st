export
exportString: aString
	aString class isBytes ifTrue:[
		dataStream nextPut: CodeByteString.
		dataStream nextUInt32Put: aString size.
		dataStream nextPutAll: aString asByteArray.
	] ifFalse:[
		dataStream nextPut: CodeWideString.
		dataStream nextUInt32Put: aString size.
		dataStream nextWordsPutAll: aString.
	].
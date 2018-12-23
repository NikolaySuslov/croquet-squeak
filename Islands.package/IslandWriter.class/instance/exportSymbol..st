export
exportSymbol: aSymbol
	aSymbol class isBytes ifTrue:[
		dataStream nextPut: CodeByteSymbol.
		dataStream nextUInt32Put: aSymbol size.
		dataStream nextPutAll: aSymbol asByteArray.
	] ifFalse:[
		dataStream nextPut: CodeWideSymbol.
		dataStream nextUInt32Put: aSymbol size.
		dataStream nextWordsPutAll: aSymbol.
	].
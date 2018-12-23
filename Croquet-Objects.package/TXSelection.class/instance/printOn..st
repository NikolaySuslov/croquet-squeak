printing
printOn: aStream
	| ivNames |
	aStream nextPutAll: self class name; nextPut: $(.
	ivNames := self class allInstVarNames.
	1 to: ivNames size do:[:i|
		aStream crtab; nextPutAll: (ivNames at: i); nextPutAll:': '.
		aStream print: (self instVarAt: i).
	].
	aStream cr; nextPut: $).

parse
parse: aStream 
	self reset.
	^self parseTree: aStream.

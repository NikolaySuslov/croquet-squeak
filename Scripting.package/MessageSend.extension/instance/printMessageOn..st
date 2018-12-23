*Scripting-Extensions
printMessageOn: aStream
	aStream print: receiver identityHash.
	aStream nextPutAll: (receiver printStringLimitedTo: 50).
	aStream nextPutAll:'>>'.
	aStream nextPutAll: (selector printStringLimitedTo: 50).
	aStream print: arguments.
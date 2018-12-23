printing
printOn: aStream
	aStream nextPutAll: self class name.
	aStream nextPutAll: ' in '.
	(self messageName notNil and:[self owner notNil]) ifTrue:[
		aStream print: self owner; nextPutAll:'>>'; nextPutAll: self messageName.
	] ifFalse:[
		suspendedContext printOn: aStream.
	].
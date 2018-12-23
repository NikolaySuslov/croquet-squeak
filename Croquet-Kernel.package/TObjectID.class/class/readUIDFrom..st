instance creation
readUIDFrom: aStream
	^self nilObjectID readUIDFrom: (aStream isString 
		ifTrue:[aStream readStream] 
		ifFalse:[aStream])
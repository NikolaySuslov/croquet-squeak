instance creation
readHexFrom: aStream
	^self nilObjectID readHexFrom: (aStream isString 
		ifTrue:[aStream readStream] 
		ifFalse:[aStream])
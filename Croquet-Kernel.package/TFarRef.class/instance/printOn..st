private
printOn: aStream
	super printOn: aStream.
	aStream nextPut:$(.
		self isResolved
			ifTrue:[aStream nextPutAll: (self get: #printString)]
			ifFalse:[aStream nextPutAll: 'unresolved'].
	aStream nextPut:$).
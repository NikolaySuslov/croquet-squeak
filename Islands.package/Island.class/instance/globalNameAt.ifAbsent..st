accessing
globalNameAt: value ifAbsent: exceptionBlock
	^globals keyAtIdentityValue: value ifAbsent: exceptionBlock.
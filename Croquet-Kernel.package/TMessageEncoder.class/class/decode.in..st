instance creation
decode: aString in: island
	^(self basicNew setStream: (ReadStream on: aString)) 
		island: island;
		next
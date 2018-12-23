read/write
writeOn: aStream
	aStream nextPutAll: receiver.
	aStream nextNumber: 4 put: selector size.
	aStream nextPutAll: selector asByteArray.
	aStream nextNumber: 4 put: arguments size.
	aStream nextPutAll: arguments.
	aStream nextPutAll: sender.
	aStream nextPutAll: msgId.
	aStream nextNumber: 4 put: (time basicAt: 1).
	aStream nextNumber: 4 put: (time basicAt: 2).
	aStream nextNumber: 4 put: sid.

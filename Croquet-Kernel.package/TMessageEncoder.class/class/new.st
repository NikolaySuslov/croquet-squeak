instance creation
new
	^self basicNew setStream: (ReadWriteStream on: (ByteArray new: 100)).
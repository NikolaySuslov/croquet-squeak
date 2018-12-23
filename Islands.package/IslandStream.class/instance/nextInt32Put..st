accessing
nextInt32Put: int32
	"Write a signed integer to the next 4 bytes"
	^self nextPutAll: ((ByteArray new: 4) longAt: 1 put: int32 bigEndian: true; yourself).
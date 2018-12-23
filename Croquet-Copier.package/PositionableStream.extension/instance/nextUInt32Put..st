*Croquet-Copier
nextUInt32Put: int32
	"Write a signed integer to the next 4 bytes"
	^self nextPutAll: ((ByteArray new: 4) unsignedLongAt: 1 put: int32 bigEndian: true; yourself).
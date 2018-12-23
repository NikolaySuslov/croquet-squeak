streaming
next: nBytes
	"Store the next n bytes from the random key stream in aCollection"
	^self next: nBytes into: (ByteArray new: nBytes) startingAt: 1
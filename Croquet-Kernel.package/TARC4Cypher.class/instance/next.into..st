streaming
next: nBytes into: aCollection
	"Store the next n bytes from the random key stream in aCollection"
	^self next: nBytes into: aCollection startingAt: 1
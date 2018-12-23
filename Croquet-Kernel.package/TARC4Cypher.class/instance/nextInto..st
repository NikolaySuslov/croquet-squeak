streaming
nextInto: aCollection
	"Store the next n bytes from the random key stream in aCollection"
	^self next: aCollection size into: aCollection startingAt: 1
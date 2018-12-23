streaming
nextInto: aCollection startingAt: start
	"Store the next n bytes from the random key stream in aCollection"
	^self next: aCollection size - start + 1 into: aCollection startingAt: start
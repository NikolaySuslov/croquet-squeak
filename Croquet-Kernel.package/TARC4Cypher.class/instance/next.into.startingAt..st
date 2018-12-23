streaming
next: n into: aCollection startingAt: start
	"Store the next n bytes from the random key stream in aCollection"
	^self process: aCollection from: start to: start + n - 1
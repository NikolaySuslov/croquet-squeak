*Croquet-Copier
nextBytesInto: byteObject

	| bytes |
	bytes := self next: byteObject basicSize.
	byteObject replaceFrom: 1 to: bytes size with: bytes startingAt: 1.
	^byteObject
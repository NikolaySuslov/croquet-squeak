*Croquet-Objects
upToAnyOf: aCharacterSet 
	"Answer string until aCharacterSet found. The answer INCLUDES the 
	character "
	"'test' readStream upToAnyOf: {$e} asCharacterSet"
	| pos buffer count |
	pos := self position.
	buffer := self next: 100.
	(count := String
					findFirstInString: buffer
					inSet: aCharacterSet byteArrayMap
					startingAt: 1) > 0
		ifTrue: [self position: pos + count.
			^ buffer copyFrom: 1 to: count].
	self atEnd
		ifTrue: ["Never found it, and hit end of file"
			^ buffer , Character end asString].
	"Never found it, but there's more..."
	^ buffer
		, (self upToAnyOf: aCharacterSet)
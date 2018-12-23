export
exportCharacter: aCharacter
	dataStream nextPut: CodeCharacter.
	dataStream nextUInt32Put: aCharacter asInteger.
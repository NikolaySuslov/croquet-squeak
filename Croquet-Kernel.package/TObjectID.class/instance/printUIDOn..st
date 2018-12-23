printing
printUIDOn: aStream
	1 to: 4 do:[:i| self printHexAt: i on: aStream].
	aStream nextPut: $-.
	5 to: 6 do:[:i| self printHexAt: i on: aStream].
	aStream nextPut: $-.
	7 to: 8 do:[:i| self printHexAt: i on: aStream].
	aStream nextPut: $-.
	9 to: 10 do:[:i| self printHexAt: i on: aStream].
	aStream nextPut: $-.
	11 to: 16 do:[:i| self printHexAt: i on: aStream].

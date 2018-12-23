printing
readUIDFrom: aStream
	1 to: 4 do:[:i| self readHexAt: i from: aStream].
	(aStream peekFor: $-) ifFalse:[^self error: 'Not an object id'].
	5 to: 6 do:[:i| self readHexAt: i from: aStream].
	(aStream peekFor: $-) ifFalse:[^self error: 'Not an object id'].
	7 to: 8 do:[:i| self readHexAt: i from: aStream].
	(aStream peekFor: $-) ifFalse:[^self error: 'Not an object id'].
	9 to: 10 do:[:i| self readHexAt: i from: aStream].
	(aStream peekFor: $-) ifFalse:[^self error: 'Not an object id'].
	11 to: 16 do:[:i| self readHexAt: i from: aStream].

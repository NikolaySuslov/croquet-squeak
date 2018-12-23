printing
readHexAt: index from: aStream
	| map v ch value |
	map := '0123456789abcdef'.
	ch := aStream next.
	v := (map indexOf: ch) - 1.
	(v between: 0 and: 15) ifFalse:[^self error: 'Not an object id'].
	value := v bitShift: 4.
	ch := aStream next.
	v := (map indexOf: ch) - 1.
	(v between: 0 and: 15) ifFalse:[^self error: 'Not an object id'].
	value := value + v.
	self at: index put: value.
printing
readHexFrom: aStream
	| map v ch value |
	map := '0123456789abcdef'.
	1 to: self size do:[:i|
		ch := aStream next.
		v := (map indexOf: ch) - 1.
		(v between: 0 and: 15) ifFalse:[^self error: 'Not an object id'].
		value := v bitShift: 4.
		ch := aStream next.
		v := (map indexOf: ch) - 1.
		(v between: 0 and: 15) ifFalse:[^self error: 'Not an object id'].
		value := value + v.
		self at: i put: value.
	].
primitives
primitiveBasicAt: index put: value
	"Primitive. Assumes receiver is indexable. Store the second argument 
	value in the indexable element of the receiver indicated by index. Fail 
	if the index is not an Integer or is out of bounds. Or fail if the value is 
	not of the right type for this kind of collection. Answer the value that 
	was stored. Essential. Do not override in a subclass. See Object 
	documentation whatIsAPrimitive."

	<primitive: 61>
	index isInteger
		ifTrue: [(index >= 1 and: [index <= self size])
					ifTrue: [self error: 'Improper store into indexable object']
					ifFalse: [self error: 'subscript is out of bounds: ' , index printString]].
	index isNumber
		ifTrue: [^self primitiveBasicAt: index asInteger put: value]
		ifFalse: [self error: 'only integers should be used as indices']
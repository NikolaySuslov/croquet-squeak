primitives
primitiveBasicAt: index 
	"Primitive. Assumes receiver is indexable. Answer the value of an 
	indexable element in the receiver. Fail if the argument index is not an 
	Integer or is out of bounds. Essential. Do not override in a subclass. See 
	Object documentation whatIsAPrimitive."

	<primitive: 60>
	index isInteger ifTrue: [self error: 'subscript is out of bounds: ' , index printString].
	index isNumber
		ifTrue: [^self primitiveBasicAt: index asInteger]
		ifFalse: [self error: 'only integers should be used as indices']
accessing
floatAt: index
	"For subclasses that override #at:"
	<primitive: 'primitiveAt' module: 'FloatArrayPlugin'>
	^Float fromIEEE32Bit: (self basicAt: index)
accessing
floatAt: index put: value
	"For subclasses that override #at:put:"
	<primitive: 'primitiveAtPut' module: 'FloatArrayPlugin'>
	self basicAt: index put: value asIEEE32BitWord.
	^value
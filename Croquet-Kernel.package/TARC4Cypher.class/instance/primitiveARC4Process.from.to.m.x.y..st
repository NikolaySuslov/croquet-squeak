cypher
primitiveARC4Process: buffer from: startIndex to: stopIndex m: mm x: xx y: yy
	"Run the primitive. If successful, the return value is x@y"
	<primitive: 'primitiveARC4Transform' module: 'CroquetPlugin'>
	^nil "indicates failure"

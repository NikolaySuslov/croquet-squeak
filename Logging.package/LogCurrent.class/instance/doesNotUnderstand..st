private
doesNotUnderstand: aMessage
	"for debugging"
	self class debugMode ifTrue: [ Transcript show: self class name, ' DNU ', aMessage printString; cr ].
	
	aMessage selector isUnary
		ifTrue: [ category := aMessage selector ]
		ifFalse: [ self selectorAndArgs: aMessage]
 
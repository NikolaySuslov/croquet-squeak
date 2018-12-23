accessing
varValueOn: anIsland
	"Answer the object/value I would have on the given island.
	This version is specific for variables handling copy on read."
	anIsland == myIsland ifTrue:[^myValue].
	"Do a quick check for #passByProxy: ... "
	myValue class howToPassAsArgument == #passByProxy: ifTrue:[^self].
	" ... but otherwise use slow, generic mechanism."
	anIsland isFarRef ifTrue:[^self error: 'Cannot compute value on far island'].
	^self syncReturn: myValue from: myIsland to: anIsland
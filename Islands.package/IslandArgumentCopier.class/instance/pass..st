copying
pass: obj
	srcIsland == dstIsland ifTrue: [^ obj].
	^self perform: obj class howToPassAsArgument with: obj
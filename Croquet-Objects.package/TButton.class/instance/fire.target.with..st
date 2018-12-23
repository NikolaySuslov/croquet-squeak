action
fire: aSelector target: aTarget with: optArg
	aTarget ifNil:[^nil].
	aSelector ifNil:[^nil].
	aSelector numArgs = 0 ifTrue:[^aTarget perform: aSelector].
	aSelector numArgs = 1 ifTrue:[^aTarget perform: aSelector with: optArg].
	self error:'Wrong number of args'
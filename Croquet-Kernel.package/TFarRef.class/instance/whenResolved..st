initialize
whenResolved: aBlock
	"Evaluate aBlock when I am resolved"
	| script |
	aBlock numArgs <= 1 ifFalse:[self error: 'Must be zero or one argument block'].
	self isResolved ifTrue:[
		aBlock numArgs = 0 ifTrue:[^aBlock value].
		aBlock numArgs = 1 ifTrue:[^aBlock value: self].
	].
	script := self island runScript:[
		aBlock numArgs = 0 ifTrue:[aBlock value].
		aBlock numArgs = 1 ifTrue:[aBlock value: self].
		self island stopScript: script.
	] when: {self island. myName asSymbol}.
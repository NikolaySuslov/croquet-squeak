resolving
whenComplete: aBlock
	"Evaluate aBlock when I am resolved"
	aBlock numArgs <= 2 ifFalse:[self error: 'Must be less than three argument block'].
	resolver := aBlock.
	self isResolved ifTrue:[self resolve: result].
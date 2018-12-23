testing
testClass: aMessage
	^(self selectedClasses anySatisfy: [:c | (classes at: c) = aMessage key]) or:
	[self selectedClasses isEmpty]
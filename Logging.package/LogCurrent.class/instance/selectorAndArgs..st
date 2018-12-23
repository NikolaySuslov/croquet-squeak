private
selectorAndArgs: aMessage

	| selector |
	selector := aMessage selector.
	selector isUnary ifTrue: [self << aMessage selector. ^ self endEntry].
	selector keywords with: aMessage arguments do: [:key :arg |
		self << key << ' ' <<  arg printString << ' '].
	self endEntry
events
keyDown: event
	| c |
	c := event keyValue asCharacter.
	c := c asInteger - $0 asInteger.
	(c >=0 and: [c<=9]) ifTrue:[self value: c.].

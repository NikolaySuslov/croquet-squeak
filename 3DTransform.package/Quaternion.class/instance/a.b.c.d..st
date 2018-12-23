initialize
a: aValue b: bValue c: cValue d: dValue

	self a: aValue.
	self b: bValue.
	self c: cValue.
	self d: dValue.
	(aValue < 0.0) ifTrue:[self *= -1.0].
	self normalize.
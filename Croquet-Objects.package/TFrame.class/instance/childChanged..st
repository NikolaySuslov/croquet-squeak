accessing
childChanged: frame

	" Does nothing, just forward on to parent."
	self parent ifNotNil:[self parent changed: frame.]

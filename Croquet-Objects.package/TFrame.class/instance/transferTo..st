hierarchy
transferTo: frame

	| trns |
	trns :=  frame relativeTransform: self.
	self parent removeChild: self.
	self localTransform: trns.
	frame addChild: self.

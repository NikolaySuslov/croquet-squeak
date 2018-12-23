initialize
expandRequest
	self isCollapsed ifTrue:[^self expand].
	(self hasProperty: #priorBounds) ifTrue:[
		self bounds: (self valueOfProperty: #priorBounds ifAbsent:[^self]).
		self removeProperty: #priorBounds.
	] ifFalse:[
		self setProperty: #priorBounds toValue: self bounds.
		self bounds: owner bounds.
		owner addMorphFront: self.
	].
collapse-expand
expand
	self isCollapsed ifFalse:[^self].
	self setProperty: #collapseBounds toValue: self bounds.
	content visible: true.
	self addMorphBack: content.
	frame expand.
	owner addMorphFront: self.
	self bounds: (self valueOfProperty: #priorBounds ifAbsent:[^self]).
	self removeProperty: #priorBounds.
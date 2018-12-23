collapse-expand
collapse
	self isCollapsed ifTrue:[^self].
	self setProperty: #priorBounds toValue: self bounds.
	content visible: false; delete.
	frame collapse.
	self bounds: (self valueOfProperty: #collapseBounds ifAbsent:[^self]).

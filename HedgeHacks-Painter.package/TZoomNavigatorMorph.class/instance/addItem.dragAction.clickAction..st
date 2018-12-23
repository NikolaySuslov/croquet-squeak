initialize
addItem: sketch dragAction: dragAction clickAction: clickAction
	sketch setProperty: #dragAction toValue: dragAction.
	sketch setProperty: #clickAction toValue: clickAction.
	self addItem: sketch.

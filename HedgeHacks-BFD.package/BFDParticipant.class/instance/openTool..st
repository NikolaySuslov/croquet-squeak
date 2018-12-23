zoom navigator
openTool: toolClass
	| tool window |
	tool := toolClass new.
	window := tool open.
	self addMorphCentered: window.
	tool postBuildIn: self.
	^tool
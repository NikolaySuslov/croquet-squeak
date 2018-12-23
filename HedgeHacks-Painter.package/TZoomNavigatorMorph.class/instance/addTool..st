tools
addTool: toolClass
	| thumb |
	thumb := ToolFormLibrary at: toolClass name ifAbsent:[nil].
	thumb ifNil:[thumb := Form extent: 128@128 depth: 8].
	self addTool: toolClass image: thumb.
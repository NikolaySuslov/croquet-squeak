accessing
glGetTexLevelParameteri: aTarget with: level with: param
	| value |
	value := IntegerArray new: 1.
	self glGetTexLevelParameteriv: aTarget with: level with: param with: value.
	^value at: 1
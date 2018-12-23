accessing
glGetTexLevelParameterf: aTarget with: level with: param
	| value |
	value := FloatArray new: 1.
	self glGetTexLevelParameterfv: aTarget with: level with: param with: value.
	^value at: 1
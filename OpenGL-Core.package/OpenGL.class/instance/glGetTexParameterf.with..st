accessing
glGetTexParameterf: aTarget with: param
	| value |
	value := FloatArray new: 1.
	self glGetTexParameterfv: aTarget with: param with: value.
	^value at: 1
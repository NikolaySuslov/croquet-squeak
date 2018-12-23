accessing
glGetTexParameteri: aTarget with: param
	| value |
	value := IntegerArray new: 1.
	self glGetTexParameteriv: aTarget with: param with: value.
	^value at: 1
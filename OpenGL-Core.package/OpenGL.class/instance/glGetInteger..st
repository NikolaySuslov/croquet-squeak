accessing
glGetInteger: param
	| value |
	value := IntegerArray new: 1.
	self glGetIntegerv: param with: value.
	^value at: 1
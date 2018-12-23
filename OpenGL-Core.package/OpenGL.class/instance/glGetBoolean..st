accessing
glGetBoolean: param
	| value |
	value := WordArray new: 1.
	self glGetBooleanv: param with: value.
	^(value at: 1) == GLTrue
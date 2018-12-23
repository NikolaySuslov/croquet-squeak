accessing
glGetFloat: param
	| value |
	value := FloatArray new: 1.
	self glGetFloatv: param with: value.
	^value at: 1
testing
maxVertices

	|mxVrt|

	mxVrt := IntegerArray ofSize: 1.
	self glGetIntegerv: GLMaxElementsVertices with: mxVrt.
	^ mxVrt at: 1.
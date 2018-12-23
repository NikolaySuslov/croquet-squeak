testing
maxIndices

	|mxInd|

	mxInd := IntegerArray ofSize: 1.
	self glGetIntegerv: GLMaxElementsIndices with: mxInd.
	^ mxInd at: 1.
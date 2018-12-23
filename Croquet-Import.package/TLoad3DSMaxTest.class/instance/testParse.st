Testing
testParse
	| source tree |
	source := '*3DSMAX_ASCIIEXPORT	200'.
	tree := TLoad3DSMax basicNew parse: source readStream.
	self assert: tree first = #T3dsmaxAsciiexport.
	self assert: tree second = '200'.
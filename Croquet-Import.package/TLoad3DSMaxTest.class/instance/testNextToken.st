Testing
testNextToken
	| strm tload ans |
	strm := '*3DSMAX_ASCIIEXPORT	200' readStream.
	tload := TLoad3DSMax basicNew reset.
	ans := tload nextOn: strm.
	self assert: ans first = #T3dsmaxAsciiexport.
	self assert: ans second = '200'.
	self assert: (ans := tload nextOn: strm) first = #EOF.

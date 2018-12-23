Testing
testNextTokenWithParenthesis
	| strm tload ans |
	strm := '	*MATERIAL 0 {
		*MATERIAL_NAME "plateau01"
		*LONG 1 2 3 *MULTI 4	5	6
	}' readStream.
	tload := TLoad3DSMax basicNew.
	ans := tload reset nextOn: strm.
	self assert: ans first = #TMaterial.
	self assert: ans second = '0'.

	ans := tload nextOn: strm.
	self assert: ans first = #BEGIN.

	ans := tload nextOn: strm.
	self assert: ans first = #TMaterialName.
	self assert: ans second = '"plateau01"'.

	ans := tload nextOn: strm.
	self assert: ans first = #TLong.
	self assert: ans second = '1 2 3'.

	ans := tload nextOn: strm.
	self assert: ans first = #TMulti.
	self assert: ans second = '4	5	6'.

	ans := tload nextOn: strm.
	self assert: ans first = #END.

	self assert: (ans := tload nextOn: strm) first = #EOF.

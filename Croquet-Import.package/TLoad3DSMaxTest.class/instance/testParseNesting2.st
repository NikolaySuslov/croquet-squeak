Testing
testParseNesting2
	| source tree |
	source := '
*FIRST 1
*SECOND  2 {
	*THIRD 3 {
	}
}
*FIFTH 5
'.
	tree := TLoad3DSMax basicNew parse: source readStream.
	self assert: tree first = #TFirst.
	self assert: tree last = '5'.

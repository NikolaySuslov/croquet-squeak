float tests
testLog10
	| hash |
	hash := self floatTest:[:f| f abs log].
	self assert: hash = 135564553959509933253581837789050718785
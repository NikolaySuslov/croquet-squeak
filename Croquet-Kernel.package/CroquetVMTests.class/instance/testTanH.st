float tests
testTanH
	| hash |
	hash := self floatTest:[:f| f tanH].
	self assert: hash = 15738508136206638425252880299326548123
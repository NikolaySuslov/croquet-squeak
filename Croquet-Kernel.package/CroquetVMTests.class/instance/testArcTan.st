float tests
testArcTan
	| hash |
	hash := self floatTest:[:f| f arcTan].
	self assert: hash = 17311773710959114634056077345168823659
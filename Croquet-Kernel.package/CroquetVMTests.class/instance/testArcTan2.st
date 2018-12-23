float tests
testArcTan2
	| hash |
	hash := self floatTest:[:f| f arcTan: f].
	self assert: hash = 287068347279655848752274030373495709564
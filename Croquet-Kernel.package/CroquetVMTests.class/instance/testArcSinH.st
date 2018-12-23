float tests
testArcSinH
	| hash |
	hash := self floatTest:[:f| f arcSinH].
	self assert: hash = 255911863578190171815115260235896145802
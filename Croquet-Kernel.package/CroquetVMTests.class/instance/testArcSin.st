float tests
testArcSin
	| hash |
	hash := self floatTest:[:f| f arcSin].
	self assert: hash = 27372132577303862731837100895783885417
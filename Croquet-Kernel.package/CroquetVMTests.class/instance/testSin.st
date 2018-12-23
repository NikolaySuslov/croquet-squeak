float tests
testSin
	| hash |
	hash := self floatTest:[:f| f sin].
	self assert: hash = 290162321010315440569513182938961037473
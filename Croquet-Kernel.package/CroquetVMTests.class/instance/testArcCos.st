float tests
testArcCos
	| hash |
	hash := self floatTest:[:f| f arcCos].
	self assert: hash = 320603091210691421897131240956682310429
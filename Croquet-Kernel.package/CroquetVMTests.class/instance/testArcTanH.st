float tests
testArcTanH
	| hash |
	hash := self floatTest:[:f| f arcTanH].
	self assert: hash = 295711907369004359459882231908879164929
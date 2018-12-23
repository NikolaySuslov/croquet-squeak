float tests
testSqrt
	| hash |
	hash := self floatTest:[:f| f abs sqrt].
	self assert: hash = 112236588358122834093969606123302196127
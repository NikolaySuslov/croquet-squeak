float tests
testTan
	| hash |
	hash := self floatTest:[:f| f tan].
	self assert: hash = 207143885112027702205238433494882679660
float tests
testCos
	| hash |
	hash := self floatTest:[:f| f cos].
	self assert: hash = 110207739557966732640546618158077332978
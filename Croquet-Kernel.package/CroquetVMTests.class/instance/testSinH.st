float tests
testSinH
	| hash |
	hash := self floatTest:[:f| f sinH].
	self assert: hash = 146029709156303766079448006055284064911
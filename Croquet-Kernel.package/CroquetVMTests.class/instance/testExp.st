float tests
testExp
	| hash |
	hash := self floatTest:[:f| f exp].
	self assert: hash = 264681209343177480335132131244505189510
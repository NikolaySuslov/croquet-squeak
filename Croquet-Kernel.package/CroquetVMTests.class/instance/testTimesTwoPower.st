float tests
testTimesTwoPower
	| hash |
	hash := self floatTest:[:f| f timesTwoPower: (random nextInt: 200) - 100].
	self assert: hash = 278837335583284459890979576373223649870.
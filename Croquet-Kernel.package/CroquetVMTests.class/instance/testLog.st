float tests
testLog
	| hash |
	hash := self floatTest:[:f| f abs ln].
	self assert: hash = 24389651894375564945708989023746058645
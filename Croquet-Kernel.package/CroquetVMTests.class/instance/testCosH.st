float tests
testCosH
	| hash |
	hash := self floatTest:[:f| f cosH].
	self assert: hash = 139309299067563830037108641802292492276
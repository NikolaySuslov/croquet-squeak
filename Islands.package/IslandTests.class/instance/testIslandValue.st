tests-simple
testIslandValue
	| island obj |
	island := Island named: 'test'.
	obj := island new: TestVariable.
	self assert:(obj value == nil).
	obj value: 42.
	self assert: (obj value == 42).
	obj value: island.
	self assert: (obj value == island).

tests-simple
testIslandGlobal
	| island obj |
	island := Island named: 'test'.
	obj := island new: TestVariable.
	island at: #test put: obj.
	self assert: (island at: #test) == obj.

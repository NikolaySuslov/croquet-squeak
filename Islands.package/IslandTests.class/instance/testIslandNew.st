tests-simple
testIslandNew
	| island obj |
	island := Island named: 'test'.
	obj := island new: TestVariable.
	self assert: (obj isFarRef).
	self assert: (obj island == island).
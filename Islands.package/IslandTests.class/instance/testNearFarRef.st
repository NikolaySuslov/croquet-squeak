tests-simple
testNearFarRef
	| island var |
	island := Island named: 'test'.
	var := island new: TestVariable.
	self assert: (self island classOf: var) == FarRef.
	self assert: (island classOf: var) == TestVariable.
	var := TestVariable new.
	self assert: (self island classOf: var) == TestVariable.
	self assert: (island classOf: var) == FarRef.


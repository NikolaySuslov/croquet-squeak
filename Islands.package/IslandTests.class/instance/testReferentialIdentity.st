tests-simple
testReferentialIdentity
	| island var obj |
	island := Island named: 'test'.
	var := island new: TestVariable.
	island at: #test put: var.
	obj := island at: #test.
	self assert: (var class == FarRef).
	self assert: (obj class == FarRef).
	self assert: (var == obj).

	var := TestVariable new.
	island at: #test put: var.
	obj := island at: #test.
	self assert: (var class == TestVariable).
	self assert: (obj class == TestVariable).
	self assert: (var == obj).


tests-simple
testIslandVeil
	| island |
	island := Island named: 'test'.
	self assert: (island isFarRef).
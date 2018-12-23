float tests
testFraction
	| hash |
	hash := self floatTest:[:f| f fractionPart].
	self assert: hash = 320444785026869345695277323179170692004
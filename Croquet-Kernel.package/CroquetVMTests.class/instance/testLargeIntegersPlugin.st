plugins
testLargeIntegersPlugin
	Smalltalk platformName = 'Win32'
		ifTrue:[^self internalPlugin: 'LargeIntegers'].
	self eitherPlugin: 'LargeIntegers'.
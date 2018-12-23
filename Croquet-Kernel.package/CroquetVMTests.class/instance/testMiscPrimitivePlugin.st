plugins
testMiscPrimitivePlugin
	Smalltalk platformName = 'Win32'
		ifTrue:[^self internalPlugin: 'MiscPrimitivePlugin'].
	self eitherPlugin: 'MiscPrimitivePlugin'.
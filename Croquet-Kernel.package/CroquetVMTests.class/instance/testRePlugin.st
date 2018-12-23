plugins
testRePlugin
	Smalltalk platformName = 'Win32'
		ifTrue:[^self internalPlugin: 'RePlugin'].
	self eitherPlugin: 'RePlugin'.
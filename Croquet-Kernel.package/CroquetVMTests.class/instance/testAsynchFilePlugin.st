plugins
testAsynchFilePlugin
	Smalltalk platformName = 'Win32'
		ifTrue:[^self internalPlugin: 'AsynchFilePlugin'].
	self eitherPlugin: 'AsynchFilePlugin'.
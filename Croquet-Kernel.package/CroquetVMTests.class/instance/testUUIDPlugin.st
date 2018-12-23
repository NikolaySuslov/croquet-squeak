plugins
testUUIDPlugin
	Smalltalk platformName = 'Win32'
		ifTrue:[^self internalPlugin: 'UUIDPlugin'].
	self eitherPlugin: 'UUIDPlugin'.
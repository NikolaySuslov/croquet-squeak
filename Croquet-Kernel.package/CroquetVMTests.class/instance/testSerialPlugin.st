plugins
testSerialPlugin
	Smalltalk platformName = 'Win32'
		ifTrue:[^self internalPlugin: 'SerialPlugin'].
	self eitherPlugin: 'SerialPlugin'.
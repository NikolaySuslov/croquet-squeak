plugins
testFilePlugin
	Smalltalk platformName = 'Win32'
		ifTrue:[^self internalPlugin: 'FilePlugin'].
	self eitherPlugin: 'FilePlugin'.
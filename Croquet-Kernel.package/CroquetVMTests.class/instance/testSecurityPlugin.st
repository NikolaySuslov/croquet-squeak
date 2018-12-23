plugins
testSecurityPlugin
	Smalltalk platformName = 'Win32'
		ifTrue:[^self internalPlugin: 'SecurityPlugin'].
	self eitherPlugin: 'SecurityPlugin'.
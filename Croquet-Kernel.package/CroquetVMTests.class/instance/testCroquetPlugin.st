plugins
testCroquetPlugin
	Smalltalk platformName = 'Win32'
		ifTrue:[^self internalPlugin: 'CroquetPlugin'].
	self eitherPlugin: 'CroquetPlugin'.
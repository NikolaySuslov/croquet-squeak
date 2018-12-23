plugins
testGeniePlugin
	Smalltalk platformName = 'Win32'
		ifTrue:[^self internalPlugin: 'GeniePlugin'].
	self eitherPlugin: 'GeniePlugin'.
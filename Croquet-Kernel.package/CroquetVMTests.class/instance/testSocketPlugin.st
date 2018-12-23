plugins
testSocketPlugin
	Smalltalk platformName = 'Win32'
		ifTrue:[^self internalPlugin: 'SocketPlugin'].
	self eitherPlugin: 'SocketPlugin'.
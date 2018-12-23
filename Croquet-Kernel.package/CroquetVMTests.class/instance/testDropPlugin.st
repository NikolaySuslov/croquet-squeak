plugins
testDropPlugin
	Smalltalk platformName = 'Win32'
		ifTrue:[^self internalPlugin: 'DropPlugin'].
	self eitherPlugin: 'DropPlugin'.
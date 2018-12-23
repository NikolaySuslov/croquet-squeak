plugins
testStarSqueakPlugin
	Smalltalk platformName = 'Win32'
		ifTrue:[^self internalPlugin: 'StarSqueakPlugin'].
	self eitherPlugin: 'StarSqueakPlugin'.
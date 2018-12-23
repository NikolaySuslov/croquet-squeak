plugins
testKlattPlugin
	Smalltalk platformName = 'Win32'
		ifTrue:[^self internalPlugin: 'Klatt'].
	self eitherPlugin: 'Klatt'.
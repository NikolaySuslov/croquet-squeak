plugins
testMpeg3Plugin
	Smalltalk platformName = 'Win32'
		ifTrue:[^self internalPlugin: 'Mpeg3Plugin'].
	self eitherPlugin: 'Mpeg3Plugin'.
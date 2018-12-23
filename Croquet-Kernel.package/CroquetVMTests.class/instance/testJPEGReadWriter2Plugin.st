plugins
testJPEGReadWriter2Plugin
	Smalltalk platformName = 'Win32'
		ifTrue:[^self internalPlugin: 'JPEGReadWriter2Plugin'].
	self eitherPlugin: 'JPEGReadWriter2Plugin'.
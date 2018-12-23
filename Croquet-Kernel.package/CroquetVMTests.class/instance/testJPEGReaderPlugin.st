plugins
testJPEGReaderPlugin
	Smalltalk platformName = 'Win32'
		ifTrue:[^self internalPlugin: 'JPEGReaderPlugin'].
	self eitherPlugin: 'JPEGReaderPlugin'.
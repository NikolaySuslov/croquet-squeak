plugins
testBMPReadWriterPlugin
	Smalltalk platformName = 'Win32'
		ifTrue:[^self internalPlugin: 'BMPReadWriterPlugin'].
	self eitherPlugin: 'BMPReadWriterPlugin'.
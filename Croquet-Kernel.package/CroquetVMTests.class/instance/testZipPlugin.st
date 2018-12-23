plugins
testZipPlugin
	Smalltalk platformName = 'Win32'
		ifTrue:[^self internalPlugin: 'ZipPlugin'].
	self eitherPlugin: 'ZipPlugin'.
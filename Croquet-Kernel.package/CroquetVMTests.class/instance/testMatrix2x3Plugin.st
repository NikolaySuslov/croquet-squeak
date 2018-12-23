plugins
testMatrix2x3Plugin
	Smalltalk platformName = 'Win32'
		ifTrue:[^self internalPlugin: 'Matrix2x3Plugin'].
	self eitherPlugin: 'Matrix2x3Plugin'.
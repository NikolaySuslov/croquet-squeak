plugins
testFFTPlugin
	Smalltalk platformName = 'Win32'
		ifTrue:[^self internalPlugin: 'FFTPlugin'].
	self eitherPlugin: 'FFTPlugin'.
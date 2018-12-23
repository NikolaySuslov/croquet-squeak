plugins
testADPCMCodecPlugin
	Smalltalk platformName = 'Win32'
		ifTrue:[^self internalPlugin: 'ADPCMCodecPlugin'].
	self eitherPlugin: 'ADPCMCodecPlugin'.
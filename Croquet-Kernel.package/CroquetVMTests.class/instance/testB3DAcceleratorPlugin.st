plugins
testB3DAcceleratorPlugin
	Smalltalk platformName = 'Win32'
		ifTrue:[^self internalPlugin: 'B3DAcceleratorPlugin'].
	self eitherPlugin: 'B3DAcceleratorPlugin'.
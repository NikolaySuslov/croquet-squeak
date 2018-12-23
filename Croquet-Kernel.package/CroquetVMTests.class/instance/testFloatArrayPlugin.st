plugins
testFloatArrayPlugin
	Smalltalk platformName = 'Win32'
		ifTrue:[^self internalPlugin: 'FloatArrayPlugin'].
	self eitherPlugin: 'FloatArrayPlugin'.
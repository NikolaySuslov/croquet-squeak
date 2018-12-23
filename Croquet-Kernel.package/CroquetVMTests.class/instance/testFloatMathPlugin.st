plugins
testFloatMathPlugin
	Smalltalk platformName = 'Win32'
		ifTrue:[^self internalPlugin: 'FloatMathPlugin'].
	self eitherPlugin: 'FloatMathPlugin'.
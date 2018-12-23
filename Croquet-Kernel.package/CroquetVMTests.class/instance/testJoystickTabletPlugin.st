plugins
testJoystickTabletPlugin
	Smalltalk platformName = 'Win32'
		ifTrue:[^self internalPlugin: 'JoystickTabletPlugin'].
	self eitherPlugin: 'JoystickTabletPlugin'.
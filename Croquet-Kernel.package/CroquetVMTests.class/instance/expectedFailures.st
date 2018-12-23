plugins
expectedFailures
	Smalltalk platformName = 'unix'
		ifTrue:[^#(testJoystickTabletPlugin testMIDIPlugin)].
	^#()
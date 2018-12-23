plugins
testMIDIPlugin
	Smalltalk platformName = 'Win32'
		ifTrue:[^self internalPlugin: 'MIDIPlugin'].
	self eitherPlugin: 'MIDIPlugin'.
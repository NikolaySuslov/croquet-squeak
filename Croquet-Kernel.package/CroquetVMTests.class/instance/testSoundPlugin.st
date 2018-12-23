plugins
testSoundPlugin
	Smalltalk platformName = 'Win32'
		ifTrue:[^self internalPlugin: 'SoundPlugin'].
	self eitherPlugin: 'SoundPlugin'.
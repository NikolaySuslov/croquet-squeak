plugins
testSoundGenerationPlugin
	Smalltalk platformName = 'Win32'
		ifTrue:[^self internalPlugin: 'SoundGenerationPlugin'].
	self eitherPlugin: 'SoundGenerationPlugin'.
plugins
testSoundCodecPrims
	Smalltalk platformName = 'Win32'
		ifTrue:[^self internalPlugin: 'SoundCodecPrims'].
	self eitherPlugin: 'SoundCodecPrims'.
initialize
initializeRandomGenerators

	| seed |
	self initializeRandom: Time totalSeconds.
	randomStream ifNil:["Could be initialized in superclass"
		seed := ByteArray new: 128.
		TCryptoRandom gatherEntropy: seed.
		self initializeRandomStream: seed.
	].

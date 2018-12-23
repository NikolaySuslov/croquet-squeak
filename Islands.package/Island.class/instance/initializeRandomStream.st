initialize
initializeRandomStream
"@@@@ FIXME: This needs to go out of here and be moved to TIsland since it has a dependency on the RC4 cypher. After the unification of Island/TIsland this should just go away."

	| seed |
	random := Random seed: Time totalSeconds.
	Smalltalk at: #TCryptoRandom ifPresent:[:randomClass|
		seed := ByteArray new: 128.
		randomClass gatherEntropy: seed.
		Smalltalk at: #TARC4Cypher ifPresent:[:cypherClass|
			randomStream := cypherClass new.
			randomStream key: seed.
		].
	].
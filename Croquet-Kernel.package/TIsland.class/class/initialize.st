class initialization
initialize
	"TIsland initialize"
	| seed |
	seed := ByteArray new: 128.
	TCryptoRandom gatherEntropy: seed.
	Island default random: Random new.
	Island default randomStream: TARC4Cypher new.
	Island default randomStream key: seed.
	ShouldLog := nil.
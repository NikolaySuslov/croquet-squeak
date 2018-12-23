initialize
initializeRandomStream: seed

	randomStream := TARC4Cypher new.
	randomStream key: seed.


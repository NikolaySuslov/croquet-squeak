arc4
arc4: input key: key
	| output |
	output := input shallowCopy.
	(TARC4Cypher key: key) process: output.
	^output
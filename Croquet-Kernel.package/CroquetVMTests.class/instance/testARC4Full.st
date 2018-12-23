miscellaneous
testARC4Full
	"Ensure that ARC4 works as advertised"
	"ARC4 tests vectors from OpenSSL (crypto/rc4/rc4test.c)"
	| keys inputs outputs buffer cypher |
	keys := #(
		(16r01 16r23 16r45 16r67 16r89 16rAB 16rCD 16rEF)
		(16r01 16r23 16r45 16r67 16r89 16rAB 16rCD 16rEF)
		(16r00 16r00 16r00 16r00 16r00 16r00 16r00 16r00)
		(16rEF 16r01 16r23 16r45)
		(16r01 16r23 16r45 16r67 16r89 16rAB 16rCD 16rEF)
		(16rEF 16r01 16r23 16r45)
	).
	inputs := #(
		(16r01 16r23 16r45 16r67 16r89 16rAB 16rCD 16rEF)
		(16r00 16r00 16r00 16r00 16r00 16r00 16r00 16r00)
		(16r00 16r00 16r00 16r00 16r00 16r00 16r00 16r00)
		(16r00 16r00 16r00 16r00 16r00 16r00 16r00 16r00 
		 16r00 16r00 16r00 16r00 16r00 16r00 16r00 16r00
		 16r00 16r00 16r00 16r00)
		(16r12 16r34 16r56 16r78 16r9A 16rBC 16rDE 16rF0
		 16r12 16r34 16r56 16r78 16r9A 16rBC 16rDE 16rF0
		 16r12 16r34 16r56 16r78 16r9A 16rBC 16rDE 16rF0
		 16r12 16r34 16r56 16r78)
		(16r00 16r00 16r00 16r00 16r00 16r00 16r00 16r00 16r00 16r00)
	).
	outputs := #(
		(16r76 16r28 16rCB 16r4A 16rA7 16r15 16r65 16r67)
		(16r77 16rB 16r8E 16r2D 16r2E 16rBE 16rA8 16r88)
		(16r9A 16r88 16r98 16rEB 16rED 16r25 16r89 16r53)
		(16r5B 16rD5 16r48 16rA1 16r58 16r3E 16r81 16r87 
		16rFB 16rE5 16r1B 16rD1 16rCC 16rFD 16r7F 16rDA 
		16r5C 16rD5 16rA9 16rB7)
		(16r65 16r3F 16rD8 16r55 16rB4 16r2 16r76 16r78 
		16rF3 16r5A 16rC 16r70 16r89 16rC8 16r1C 16r3B 
		16rA9 16r30 16rF5 16r6D 16rF9 16rD 16r2D 16r84 
		16rC3 16r83 16r62 16r17)
		(16r5B 16rD5 16r48 16rA1 16r58 16r3E 16r81 16r87 16rFB 16rE5)
	).
	1 to: keys size do:[:i|
		buffer := (inputs at: i) asByteArray.
		cypher := TARC4Cypher new key: (keys at: i).
		cypher process: buffer.
		self assert: buffer = (outputs at: i) asByteArray.
		cypher := TARC4Cypher new key: (keys at: i).
		cypher process: buffer.
		self assert: buffer = (inputs at: i) asByteArray.
	].
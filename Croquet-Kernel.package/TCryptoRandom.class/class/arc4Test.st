arc4
arc4Test
	"ARC4 tests vectors from OpenSSL (crypto/rc4/rc4test.c)"
	"self arc4Test"
	| keys inputs outputs result |
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
		(16r75 16rB7 16r87 16r80 16r99 16rE0 16rC5 16r96)
		(16r74 16r94 16rC2 16rE7 16r10 16r4B 16r08 16r79)
		(16rDE 16r18 16r89 16r41 16rA3 16r37 16r5D 16r3A)
		(16rD6 16rA1 16r41 16rA7 16rEC 16r3C 16r38 16rDF
		 16rBD 16r61 16r5A 16r11 16r62 16rE1 16rC7 16rBA
		 16r36 16rB6 16r78 16r58)
		(16r66 16rA0 16r94 16r9F 16r8A 16rF7 16rD6 16r89
		 16r1F 16r7F 16r83 16r2B 16rA8 16r33 16rC0 16r0C
		 16r89 16r2E 16rBE 16r30 16r14 16r3C 16rE2 16r87
		 16r40 16r01 16r1E 16rCF)
		(16rD6 16rA1 16r41 16rA7 16rEC 16r3C 16r38 16rDF 16rBD 16r61)
	).
	1 to: keys size do:[:i|
		result := self arc4: (inputs at: i) key: (keys at: i).
		result = (outputs at: i) ifFalse:[self error: 'Encryption failure'].
		result := self arc4: result key: (keys at: i).
		result = (inputs at: i) ifFalse:[self error: 'Decryption failure'].
	].
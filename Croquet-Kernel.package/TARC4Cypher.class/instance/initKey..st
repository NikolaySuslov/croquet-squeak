cypher
initKey: key
	| j k a keyLen |
	keyLen := key size.
	x := y := 0.
	m := ByteArray new: 256.
	0 to: 255 do:[:i| m at: i+1 put: i].
	j := k := 0.
	0 to: 255 do:[:i|
		a := m at: i+1.
		j := (j + a + (key at: k + 1)) bitAnd: 255.
		m at: i+1 put: (m at: j+1). m at: j+1 put: a.
		(k := k + 1) >= keyLen ifTrue:[k := 0].
	].

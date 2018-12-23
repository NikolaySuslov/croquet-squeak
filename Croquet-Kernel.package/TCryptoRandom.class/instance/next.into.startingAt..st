accessing
next: nBytes into: aCollection startingAt: startIndex
	"This is the heart of the matter. Fetch nBytes of random input."
	| hash words buf n sz index |
	buf := ByteArray new: 16.
	n := nBytes.
	index := startIndex.
	[n > 0] whileTrue:[
		"Start the md5 hash tail"
		hash := WordArray with: 16r67452301 with: 16rEFCDAB89 with: 16r98BADCFE with: 16r10325476.
		words := WordArray new: 16.
		1 to: PoolWords by: 16 do:[:i|
			words replaceFrom: 1 to: 16 with: pool startingAt: i.
			TCryptoRandom md5Transform: words hash: hash.
		].
		"Modify pool so next hash will produce different results"
		self addEntropyWord: (hash at: 1).
		self addEntropyWord: (hash at: 2).
		self addEntropyWord: (hash at: 3).
		self addEntropyWord: (hash at: 4).
		"Run the MD5 Transform one more time, since we want
		to add at least minimal obscuring of the inputs to addEntropyWord:"
		TCryptoRandom md5Transform: pool hash: hash.
		buf unsignedLongAt: 1 put: (hash at: 1) bigEndian: false.
		buf unsignedLongAt: 5 put: (hash at: 2) bigEndian: false.
		buf unsignedLongAt: 9 put: (hash at: 3) bigEndian: false.
		buf unsignedLongAt: 13 put: (hash at: 4) bigEndian: false.
		sz := n min: 16. n := n - sz.
		aCollection replaceFrom: index to: index + sz-1 with: buf startingAt: 1.
		index := index + sz.
	].
	^aCollection
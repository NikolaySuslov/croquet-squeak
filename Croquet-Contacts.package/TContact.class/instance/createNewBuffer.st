accessing
createNewBuffer
	| buf |
	buf :=('CRQT','  ',id hex, name)asByteArray.
	buf unsignedShortAt: 5 put: port bigEndian: true.
	^buf
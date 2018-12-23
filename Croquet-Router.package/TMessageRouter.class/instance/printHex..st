printing
printHex: ba
	| string v index map |
	map := '0123456789abcdef'.
	string := String new: ba size * 2. "hex"
	index := 0.
	1 to: ba size do:[:i| 
		v := ba at: i.
		string at: (index := index + 1) put: (map at: (v bitShift: -4) + 1). 
		string at: (index := index + 1) put: (map at: (v bitAnd: 15) + 1).
	].
	^string
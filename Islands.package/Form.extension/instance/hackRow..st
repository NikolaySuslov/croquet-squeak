*Islands
hackRow: bitThing
	"This method provides an initialization so that BitBlt may be used, eg, to 
	copy ByteArrays and other non-pointer objects efficiently.
	The resulting form looks 1 high, 8 deep, and bitThing-size-in-words wide."
	height := 1.
	depth := 8.
	bitThing class isBits ifFalse: [self error: 'bitThing must be a non-pointer object'].
	bitThing class isBytes
		ifTrue: [width := bitThing basicSize]
		ifFalse: [width := bitThing basicSize*4].
	bits := bitThing
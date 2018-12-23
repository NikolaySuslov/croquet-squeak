*Islands
startUpInIslandReader: reader
	"The receiver has been loaded from a binary file."
	(Smalltalk endianness) == (reader endianness)
		ifFalse:[self swapShortObjects].
*Croquet-Copier
swapHalvesIn: aNonPointerThing from: start to: stop
	"Perform a bigEndian/littleEndian byte reversal of my words.
	We only intend this for non-pointer arrays.  Do nothing if I contain pointers."
	| hack blt |
	"The implementation is a hack, but fast for large ranges"
	hack := Form new hackBits: aNonPointerThing.
	blt := (BitBlt toForm: hack) sourceForm: hack.
	blt combinationRule: Form reverse.  "XOR"
	blt sourceY: 0; destY: 0; height: self size; width: 1.
	blt sourceX: 0; destX: 1; copyBits.  "Exchange bytes 0 and 1"
	blt sourceX: 1; destX: 0; copyBits.
	blt sourceX: 0; destX: 1; copyBits.
	blt sourceX: 2; destX: 3; copyBits.  "Exchange bytes 2 and 3"
	blt sourceX: 3; destX: 2; copyBits.
	blt sourceX: 2; destX: 3; copyBits.

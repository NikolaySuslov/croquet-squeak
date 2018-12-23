accessing
addTimerRandomness: value ticks: nextTick
	"Add entropy to the pool by using timing delays"
	| delta delta2 bits |

	self addEntropyWord: nextTick.
	self addEntropyWord: value.

	"Calculate the number of bits randomness we probably added"

	delta := nextTick - lastTick.	lastTick := nextTick.
	delta2 := delta - lastDelta.	lastDelta := delta.

	delta < 0 ifTrue:[delta := 0 - delta].
	delta2 < 0 ifTrue:[delta2 := 0 - delta2].
	delta > delta2 ifTrue:[delta := delta2].

	bits := (delta bitShift: -1) highBit min: 12.
	entropy := entropy + bits.
	entropy > PoolBits ifTrue:[entropy := PoolBits].
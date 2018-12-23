interpolating
interpolateTo: end at: amountDone
	"Interpolates a new vector based on the instance vector, the end state vector, and the amount already done (between 0 and 1)."

	| tX tY tZ |
	tX := self x.
	tY := self y.
	tZ := self z.

	^ (Vector3 x: (tX + (((end x) - tX) * amountDone))
				y: (tY + (((end y) - tY) * amountDone))
				z: (tZ + (((end z) - tZ) * amountDone))).

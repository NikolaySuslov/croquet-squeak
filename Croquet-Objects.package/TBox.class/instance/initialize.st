initialize
initialize
	| iP iN |

" Defines an infinitely empty box - min is positive infinity, max is negative infinity. We then add vertices to the box via the #growVertex: method to 'grow' it."

	iP := Float infinity.
	iN := Float infinity negated.
	minCorner := Vector3 x: iP y: iP z: iP.
	maxCorner := Vector3 x: iN y: iN z: iN.

vector functions
angleTo: aVector 
	"calculate the rotation angle that rotates this vector into aVector. I return the value in terms of radians. In fact, I intend to switch everything to radians at some point. Sign is ignored - if you have a fast way to do this which retains the sign of the angle, please update this."
| s t |
	s := self normalized.
	t := aVector normalized.
	^ (s dot: t) arcCos.

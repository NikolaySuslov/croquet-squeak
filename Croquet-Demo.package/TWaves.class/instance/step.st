stepping
step
	"Calculates the wave function for the surface if countDown is non-zero. It is a simple cellular based spring function. We assume that the restoring force is based only on the difference of the z-values. Given that every action has a corresponding reaction, we need only test for delta z in three directions - down, to the right, and diagonal down and to the right. The resulting difference is added to the current cell and subtracted from the adjacent cell."

	countDown = 0 ifTrue:[
		 "stop stepping"
		stepping := false.
		^self].

	countDown := countDown-1.
	fVert replaceFrom: (size x+1) to: (fVert size) with: surface startingAt: 1.
	fVert replaceFrom: 1 to: size x with: surface startingAt: 1.
	fVert -= surface.
	fHorz replaceFrom: 2 to: (fHorz size) with: surface startingAt: 1.
	1 to: size y do:[:i | | dy |
		dy := (i-1) * size x + 1.
		fHorz at: dy put: (surface at: dy).].

	fHorz -= surface.

	fDiag1 replaceFrom: (size x + 2) to: (fDiag1 size) with: surface startingAt:1.
	fDiag1 -= surface.
	fDiag2 replaceFrom: (size x -1) to: (fDiag2 size) with: surface startingAt: 1.
	fDiag2 -= surface.

	force replaceFrom: 1 to: force size with: fVert.
	fVert replaceFrom: 1 to: (fVert size - size x) with: fVert startingAt:(size x + 1).
	force -=fVert.

	force +=fHorz.
	fHorz replaceFrom: 1 to: (fHorz size - 1) with: fHorz startingAt: 2.
	force -=fHorz.

	fDiag1 *= oneOverSqrtTwo.
	force += fDiag1.
	fDiag1 replaceFrom: 1 to: (fDiag1 size - (size x +2)) with: fDiag1 startingAt: (size x + 2).
	force -= fDiag1.

	fDiag2 *= oneOverSqrtTwo.
	force += fDiag2.
	fDiag2 replaceFrom: 1 to: (fDiag2 size - (size x -1)) with: fDiag2 startingAt: (size x - 1).
	force -= fDiag2.

	force *= 0.02.
	velocity += force.
	surface += velocity.
	surface *= 0.97.

	(self future: 40) step
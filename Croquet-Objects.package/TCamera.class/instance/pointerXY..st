transform
pointerXY: pXY

	| bCenter at up side cpointer |
" x and y are negated on purpose. Why? Because the z value should actually be negated as it is referring to a position in front of the camera (in the negative z direction) but anyone trying to do the math for TPointer will probably want to use a positive direction vector. OK? Get it? Essentially the math is wrong, but it is consistent. "
	bCenter := self bounds center.
	at := (Vector3
				x: bCenter x - pXY x
				y: pXY y - bCenter y
				z: zScreen ) normalized.
	up := Vector3 x: 0.0 y:1.0 z:0.0.
	side := (up cross: at) normalized.
	up := (at cross: side) normalized.

	cpointer := Matrix4x4 identity.
	cpointer at: 1 at: 1 put: side x.
	cpointer at: 1 at: 2 put: side y.
	cpointer at: 1 at: 3 put: side z.
	cpointer at: 2 at: 1 put: up x.
	cpointer at: 2 at: 2 put: up y.
	cpointer at: 2 at: 3 put: up z.
	cpointer at: 3 at: 1 put: at x.
	cpointer at: 3 at: 2 put: at y.
	cpointer at: 3 at: 3 put: at z.
	^ cpointer transposed.

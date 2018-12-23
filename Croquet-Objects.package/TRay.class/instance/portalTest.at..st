picking
portalTest: frame at: at
	| rval saveFP up side |

	saveFP := framePointer.
	rval := false.

	up := Vector3 x: 0.0 y:1.0 z:0.0.
	side := (up cross: at) normalized.
	up := (at cross: side) normalized.
	framePointer := Matrix4x4 identity.
	framePointer at: 1 at: 1 put: side x.
	framePointer at: 1 at: 2 put: side y.
	framePointer at: 1 at: 3 put: side z.
	framePointer at: 2 at: 1 put: up x.
	framePointer at: 2 at: 2 put: up y.
	framePointer at: 2 at: 3 put: up z.
	framePointer at: 3 at: 1 put: at x.
	framePointer at: 3 at: 2 put: at y.
	framePointer at: 3 at: 3 put: at z.

	self testDistance: false.
	(frame pick: self) ifTrue:[ rval := true.].
	self testDistance: true.
	framePointer := saveFP.
	^ rval.

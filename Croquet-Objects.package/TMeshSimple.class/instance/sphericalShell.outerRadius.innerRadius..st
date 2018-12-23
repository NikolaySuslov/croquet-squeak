initialize
sphericalShell: numPoints outerRadius: or innerRadius: ir
	
	| good pt vs irsq orsq ptsq rg m1 or2 ns |

	self clear.

	vs := Vector3Array new: numPoints.
	ns := Vector3Array new: numPoints.
	pt := Vector3      new.
	rg := Random new.
	m1 := Vector3 x: 0.5 y: 0.5 z: 0.5.
	
	irsq := ir * ir.
	orsq := or * or.
	or2 := or * 2.0.

	good := 0.
	[good < numPoints] whileTrue: [
		pt x: rg next
		   y: rg next
		   z: rg next.
		pt -= m1.
		pt *= or2.
		ptsq := pt squaredLength.
		((ptsq > irsq) and: [ptsq < orsq]) ifTrue: [	
			good := good + 1.
			vs at: good put: pt.
			ns at: good put: pt normalized.
			].
		].

	self vertices: vs.
	self normals:  ns.

	self provideColors.

	self boundsChanged.
	
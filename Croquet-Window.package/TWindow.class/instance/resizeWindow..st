actions
resizeWindow: event
	"Same as superclass, but with different event numbers."
	| delta deltaLoc sz pointer |
	pointer := event makePointer.
	(pointer frame: windowFrame pickPlane: selectedPoint normal: windowFrame frontNorm) ifTrue:[
		delta := selectedPoint - pointer selectedPoint.
		deltaLoc := delta/2.0.

		0.875 = eventNum ifTrue:[ delta y: delta y negated. ].
		0.125 = eventNum ifTrue:[ delta x: delta x negated. delta y: delta y negated.].
		0.375 = eventNum ifTrue:[ delta x: delta x negated. ].
		" 0.625 = eventNum ifTrue:[ --- do nothing --- ]."
		sz := windowFrame extent asPoint.
		sz := (sz x + delta x) @ (sz y + delta y) max:1.0@1.0.
		self extent: sz.
		self translation: (self translation - (self orientation localPointToGlobal: deltaLoc)).
		selectedPoint := selectedPoint - (Vector3 x: deltaLoc x y: deltaLoc y z: 0.0).
		tinyCube translation: selectedPoint.
		^ true.].
	^ false.
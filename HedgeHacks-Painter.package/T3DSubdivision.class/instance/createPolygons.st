private
createPolygons
	| poly firstPoly |
	firstPoly := nil.
	self innerTriangleEdgesDo:[:e1 :e2 :e3|
		poly := T3DTriangle new.
		poly e1: e1 e2: e2 e3: e3.
		poly recomputeType.
		poly next: firstPoly.
		firstPoly := poly.
	].
	^firstPoly
mini ball
privateMtfSphereFromP1: p1 p2: p2
	"Two points"
	| delta center rad2 |
	center := (p1 + p2).
	center *= 0.5.
	delta := center - p1.
	rad2 := delta dot: delta.
	localPosition := center.
	radiusSquared := rad2.
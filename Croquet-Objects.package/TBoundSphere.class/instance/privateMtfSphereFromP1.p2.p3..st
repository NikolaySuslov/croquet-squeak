mini ball
privateMtfSphereFromP1: p1 p2: p2 p3: p3
	| d1 d2 d3 v1 v2 v3 m b rad2 center |
	v1 := (p1 + p2). v1 *= 0.5.
	v2 := (p1 + p3). v2 *= 0.5.
	v3 := p1.

	d1 := (p2 - p1).
	d2 := (p3 - p1).
	d3 := d1 cross: d2.
	m := Matrix4x4 new.
	m
		a11: d1 x; a12: d1 y; a13: d1 z;
		a21: d2 x; a22: d2 y; a23: d2 z;
		a31: d3 x; a32: d3 y; a33: d3 z.
	b := Vector3
			x: (v1 dot: d1)
			y: (v2 dot: d2)
			z: (v3 dot: d3).
	center := m solve3x3: b.
	center ifNil:[^self privateMtfSphereFromP1: p1 p2: p2].
	d1 := center - p1.
	rad2 := d1 dot: d1.
	localPosition := center.
	radiusSquared := rad2.

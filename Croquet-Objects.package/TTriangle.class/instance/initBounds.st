initialize
initBounds

	| d1 d2 d3 c1 c2 c3 c radius center v1 v2 v3 |

	v1 := vertexBuffer first.
	v2 := vertexBuffer second.
	v3 := vertexBuffer third.

" Graphics Gems 1 - page 22"

	d1 := (v2-v1) dot: (v2-v1).
	d2 := (v3-v2) dot: (v1- v2).
	d3 := (v1-v3) dot: (v2-v3).
	c1 := d2*d3.
	c2 := d3*d1.
	c3 := d1*d2.
	c := c1+c2+c3.

	radius := ((d1+d2)*(d2+d3)*(d3+d1)/c)sqrt * 0.5.
	center := (((c2+c3)*v1) + ((c3+c1)*v2) + ((c1+c2)*v3))/(2*c).
	boundSphere := TBoundSphere localPosition: center radius: radius.
	boundSphere frame: self.


picking
pickRightCylinderFrom: pnt1 to: pnt2 radius: rad

	| p1 p2 pd d ps s pn pa dd ip |

" 	Pick a right cylinder.

	p1, p2 axis points of the cylinder relative to the framePosition.
	pd - the cutting plane. The ray is on this plane, which is parallel to the cylinder axis.
	d - distance of plane from cylinder axis.
	s - distance from d point (p1 + d*p) to cylinder surface.
	ps - vector on plane, perpendicular to axis.
	pn - normal vector.
	ip - selected point "

	p1 := pnt1 - self framePosition.
	p2 := pnt2 - self framePosition.

" Calculate the cutting plane between the ray and parallel to the axis of the cylinder. "
	pd := (self framePointer row3 cross: (p1-p2)).
" Test if the ray is parallel to axis."
	(pd dot: pd)=0 ifTrue:[ ^ false.].
	pd normalize.

" Test to see if the plane (and hence the ray) distance is less than the rad distance to the center of the cylinder."
	d := pd dot: p1.
	d abs >rad ifTrue:[ ^ false.]. 

" Calculate the perpendicular normal to the axis on the plane."
	s := ((rad*rad)-(d*d))sqrt.
	ps := ((p1-p2) cross: pd) normalized.

" Calculate the normal on the cylinder at the intersection point."
	pn := ((s*ps)-(d*pd)).
	
" Now we just calculate the intersections between two lines."
	p1 := p1 + pn.
	p2 := p2 + pn.
	pn normalize.

	pa := (p2-p1) normalized.

" We know that the two lines can't be parallel because we tested earlier."
	dd := (self framePointer row3) cross: pa.
	
	s:= (((p1 cross: pa) dot: dd)/(dd dot: dd)).
	ip := framePointer row3 * s.

" Test if we are between the two ends of the cylinder."
	((ip-p1) dot: pa)*((ip-p2) dot: pa)>0 ifTrue:[
		"The point is outside the bounds"
		^ false.].

	s := s abs.
	(self testSelectedDistance: s)=0 ifFalse:[^false].
	self selectedDistance: s.
	self selectedPoint: (ip + self framePosition).
	self selectedNormal: pn.
	^ true.
	
	






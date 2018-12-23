picking
pickFrame: framePtr tri: p1 tri: p2 tri: p3


" This method works by using the orthogonal picking matrix as orthogonal planes going through the origin at 'origin'. The points of the triangle are tested to the two planes orthoganal to the direction of picking. If they are on either side of both planes, then there is a very high probability that our picking ray interesects the triangle, and we do the actual calculation of the intersection point. Note the comments below. I use a vertical bar to indicate which side of the plane a point is on.  ***** p1 p2 | ***** means that p1 and p2 are on the same side, 
***** p1 | p2 ***** indicates that they are on opposite sides. p1 is always on the left side, because it is the first one I test. This really just means - same side as p1 - no meaning other than that. 

This can be optimized for tri-strips, tri-fans, and even full face based meshes. When I have the time... "

	| d1 d2 d3 pp1 pp2 dd1 dd2 xPlane yPlane  |
		
	xPlane := framePtr row1.
	d1 := xPlane dot: p1.
	d2 := xPlane dot: p2.
	d3 := xPlane dot: p3.
	dd1 := d1*d2.
	dd2 := d1*d3.

" test if all points are on the same side of the x plane."
	dd1 < 0 ifFalse:[ 				"***** p1 p2 |  *****"
		dd2 < 0  ifFalse:[  ^ false		"***** p1 p2 p3 | *****" ] 
				ifTrue:[ 			"***** p1 p2 | p3 *****"
						pp1 := p1 + ((p3-p1) * d1/(d1-d3)).
						pp2 := p2 + ((p3-p2) * d2/(d2-d3)).]]
		ifTrue:[ 				"***** p1 | p2 *****"
			dd2 < 0  ifTrue:[ 		"***** p1 | p2 p3 *****" 
						pp1 := p1 + ((p2-p1) * d1/(d1-d2)).
						pp2 := p1 + ((p3-p1) * d1/(d1-d3)).] 
					ifFalse:[ 		"***** p1 p3 | p2 *****"
						pp1 := p1 + ((p2-p1) * d1/(d1-d2)).
						pp2 := p3 + ((p2-p3) * d3/(d3-d2)).].].
" At this point, the triangle is intersected by the x plane and we know where. If both points are on the same side of the y plane, we are done. "
	yPlane := framePtr row2.

	d1 := yPlane dot: pp1.
	d2 := yPlane dot: pp2.
" test if both points are on the same side of the y plane."
	d1 * d2 < 0 ifFalse:[ 
	 ^ false ].
	pp1 := pp1 + ((pp2-pp1) *  d1/ (d1-d2)).
	d1 := pp1 squaredLength.
	(self testSelectedDistanceSquared: d1) ifTrue:
		[
			(self verifySelectedPoint: self framePosition-pp1) ifTrue:[
				self selectedDistanceSquared: d1.
				^ true.
			].
		].

	^ false.

	
	


	


	
comparing
intersectT1: t1 T2: t2 T3: t3

	| v1 v2 v3 e1 e2 e3 a1 a2 a3 center tNormal d vmin vmax minCornerVal maxCornerVal t1val t2val t3val extent |
self error:'This code appears to be broken. Use #intersectV1:V2:V3 instead.'.
" This method is based upon:
	Fast 3D Triangle-Box Overlap Testing 
	Tomas Akenine-Moller
	March 2001, updated June 2001.

The order of this code is somewhat different from that presented in the example C source provided with the paper.

Though this is considered to be the fastest test in the graphics literature, I think that there is a better approach by attempting to construct a seperating plane between the two objects. Since I am not currently using it for real-time work, I won't worry about it."

" First, the naive test - is the triangle all on one side of a half-plane?"
	minCornerVal := minCorner x.
	t1val := t1 x. 
	t2val := t2 x. 
	t3val := t3 x. 
	(t1val < minCornerVal and:[ t2val < minCornerVal and:[ t3val < minCornerVal]]) 
		ifTrue:[ ^ false. ].
	maxCornerVal := maxCorner x.
	(t1val > maxCornerVal and:[. t2val > maxCornerVal and:[ t3val > maxCornerVal]]) 
		ifTrue:[ ^ false. ].
	minCornerVal := minCorner y.
	t1val := t1 y. 
	t2val := t2 y. 
	t3val := t3 y. 
	(t1val < minCornerVal and:[ t2val < minCornerVal and:[ t3val < minCornerVal]]) 
		ifTrue:[^ false. ].
	maxCornerVal := maxCorner y.
	(t1val > maxCornerVal and:[ t2val > maxCornerVal and:[ t3val > maxCornerVal]]) 
		ifTrue:[ ^ false. ].
	minCornerVal := minCorner z.
	t1val := t1 z. 
	t2val := t2 z. 
	t3val := t3 z. 
	(t1val < minCornerVal and:[ t2val < minCornerVal and:[ t3val < minCornerVal]]) 
		ifTrue:[ ^ false. ].
	maxCornerVal := maxCorner z.
	(t1val > maxCornerVal and:[ t2val > maxCornerVal and:[ t3val > maxCornerVal]]) 
		ifTrue:[ ^ false. ].
" Second, the cross product (edge from tri, (x y z) direction. "
	center := self center.
	v1 := t1 - center.
	v2 := t2 - center.
	v3 := t3 - center.

	e1 := t2 - t1.
	a1 := e1 abs.
	(self axisTestXv1:v1 v2:v3 a: e1 z  b: e1 y fa: a1 z fb: a1 y) ifFalse:[^ false.].
	(self axisTestYv1:v1 v2:v3 a: e1 z b: e1 x fa: a1 z fb: a1 x) ifFalse:[^ false.].
	(self axisTestZv1:v2 v2:v3 a: e1 y b: e1 x fa: a1 y fb: a1 x) ifFalse:[^ false.].

	e2 := t3 - t2.
	a2 := e2 abs.
	(self axisTestXv1:v1 v2:v3 a: e2 z  b: e2 y fa: a2 z fb: a2 y) ifFalse:[^ false.].
	(self axisTestYv1:v1 v2:v3 a: e2 z b: e2 x fa: a2 z fb: a2 x) ifFalse:[^ false.].
	(self axisTestZv1: v1 v2:v2 a:e2 y b: e2 x fa: a2 y fb: a2 x) ifFalse:[^ false.].

	e3 := t1 - t3.
	a3 := e3 abs.
	(self axisTestXv1:v1 v2:v2 a: e3 z  b: e3 y fa: a3 z fb: a3 y) ifFalse:[^ false.].
	(self axisTestYv1:v1 v2:v2 a: e3 z b: e3 x fa: a3 z fb: a3 x) ifFalse:[^ false.].
	(self axisTestZv1:v2 v2:v3 a: e3 y b: e3 x fa: a3 y fb: a3 x) ifFalse:[^ false.].

" Third, test if the box intersects the plane of the triangle."

	tNormal := e1 cross: e2.
	d := (tNormal dot: v1)negated.
	vmin := Vector3 new.	
	vmax := Vector3 new.
	
	extent := self extentX.
	tNormal x>0.0 ifTrue:[
		vmin x: extent negated.
		vmax x: extent.] 
		ifFalse:[
		vmin x: extent.
		vmax x: extent negated.].
	extent := self extentY.
	tNormal y>0.0 ifTrue:[
		vmin y: extent negated.
		vmax y: extent.] 
		ifFalse:[
		vmin y: extent.
		vmax y: extent negated.].
	extent := self extentZ.
	tNormal z>0.0 ifTrue:[
		vmin z: extent negated.
		vmax z: extent.] 
		ifFalse:[
		vmin z: extent.
		vmax z: extent negated.].
	(tNormal dot: vmin)+d >0.0 ifTrue:[^ false. ].
	(tNormal dot: vmax)+d >= 0.0 ifTrue:[^ true.].
	^ true.
	
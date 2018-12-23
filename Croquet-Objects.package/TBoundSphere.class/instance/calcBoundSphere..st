construct
calcBoundSphere: verts

	|  iP iN xmx xmn ymx ymn zmx zmn xspan yspan zspan maxSpan d1 d2 center radSq rad |
	
" This routine is from the Graphics Gems 1, C code on page 723. verts is a Vector3Array. It constructs a bounding sphere from the vertices."

	iP := Float infinity.
	iN := Float infinity negated.

	xmx := Vector3 x: iN y: iN z: iN.
	ymx := Vector3 x: iN y: iN z: iN.
	zmx := Vector3 x: iN y: iN z: iN.
	xmn := Vector3 x: iP y: iP z: iP.
	ymn := Vector3 x: iP y: iP z: iP.
	zmn := Vector3 x: iP y: iP z: iP.

" First pass, find a pair of maximally distant points between each axis."
	verts do:[ :v |
		v x > xmx x ifTrue:[ xmx := v].
		v x < xmn x ifTrue:[ xmn := v].
		v y > ymx y ifTrue:[ ymx := v].
		v y < ymn y ifTrue:[ ymn := v].
		v z > zmx z ifTrue:[ zmx := v].
		v z < zmn z ifTrue:[ zmn := v].].

	xspan := (xmx-xmn) squaredLength.
	yspan := (ymx-ymn) squaredLength.
	zspan := (zmx-zmn) squaredLength.
		
	maxSpan := xspan.
	d1 := xmn.
	d2 := xmx.
	yspan > maxSpan ifTrue:[maxSpan := yspan. d1 := ymn. d2 := ymx.].
	zspan > maxSpan ifTrue:[maxSpan := zspan. d1 := zmn. d2 := zmx.].
	
	center := (d1 + d2)/2.0.
	radSq := (d1 - center) squaredLength.
	rad := radSq sqrt.
	
"Second pass, expand sphere to include outlying points."

	verts do:[ :v |
		d1 := (v-center)squaredLength.
		d1 > radSq ifTrue:[
			d1 := d1 sqrt.
			rad := (d1 + rad)/2.0.
			radSq := rad*rad.
			d2 := d1 - rad.
			center := ((rad * center) + (d2*v))/d1.
			].
		].

	localPosition := center.
	radius := rad.
	radiusSquared := radSq.
"	vertices := verts. " "don't need this and it screws up other things later."
	^  self.
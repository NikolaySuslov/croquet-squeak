render
pick: pointer

	| dx dy dxn dyn rs sel |

	rs := radius * radius.
	dx := extent x/2.0.
	dy := extent y/2.0.
	dxn := dx negated.
	dyn := dy negated.
	sel := pointer copiedSelection.

" Top "
	(pointer pickRightCylinderFrom: (Vector3 x: dxn y: dy z: 0) to:
							    (Vector3 x: dx y: dy z: 0) radius: radius) ifTrue:
		[
		pointer selectedPoint y< dy ifTrue:[ 
			pointer selected: sel.
			(pointer pickQuad: (Vector3 x:0 y: -1 z: 0) 
				q1: (Vector3 x:dx negated y: dy z: radius)
				q2: (Vector3 x:dx y: dy z: radius)
				q3: (Vector3 x:dx y: dy z: radius negated)
				q4: (Vector3 x: dx negated y: dy z: radius negated)) ifTrue:[
					pointer selectedIndex: 0.0.
					^ true.].]
		ifFalse:[
			pointer selectedIndex: 0.0.
			^ true.].].
" Bottom "
	(pointer pickRightCylinderFrom: (Vector3 x: dxn y: dyn z: 0) to:
							    (Vector3 x: dx y: dyn z: 0) radius: radius) ifTrue:
		[
		pointer selectedPoint y> (dy negated) ifTrue:[ 
			pointer selected: sel.
			(pointer pickQuad: (Vector3 x:0 y: 1 z: 0) 
				q1: (Vector3 x:dx negated y: dy negated z: radius)
				q2: (Vector3 x:dx y: dy negated z: radius)
				q3: (Vector3 x:dx y: dy negated z: radius negated)
				q4: (Vector3 x: dx negated y: dy negated z: radius negated)) ifTrue:[
					pointer selectedIndex: 0.5.
					^ true.].]
		ifFalse:[
			pointer selectedIndex: 0.5.
			^ true.].].
" Left "
	(pointer pickRightCylinderFrom: (Vector3 x: dxn y: dy z: 0) to:
							    (Vector3 x: dxn y: dyn z: 0) radius: radius) ifTrue:
		[
		pointer selectedPoint x> (dx negated) ifTrue:[ 
			pointer selected: sel.
			(pointer pickQuad: (Vector3 x:1 y: 0 z: 0) 
				q1: (Vector3 x:dx negated y: dy negated z: radius)
				q2: (Vector3 x:dx negated y: dy negated z: radius negated)
				q3: (Vector3 x:dx negated y: dy  z: radius negated)
				q4: (Vector3 x: dx negated y: dy  z: radius )) ifTrue:[
					pointer selectedIndex: 0.75.
					^ true.].]
		ifFalse:[
		pointer selectedIndex: 0.75.
		^ true.].].

" Right "
	(pointer pickRightCylinderFrom: (Vector3 x: dx y: dy z: 0) to:
							    (Vector3 x: dx y: dyn z: 0) radius: radius) ifTrue:
		[
		pointer selectedPoint x< dx ifTrue:[ 
			pointer selected: sel.
			(pointer pickQuad: (Vector3 x:-1 y: 0 z: 0) 
				q1: (Vector3 x:dx  y: dy negated z: radius)
				q2: (Vector3 x:dx  y: dy negated z: radius negated)
				q3: (Vector3 x:dx  y: dy  z: radius negated)
				q4: (Vector3 x: dx  y: dy  z: radius )) ifTrue:[
					pointer selectedIndex: 0.25.
					^ true.].]
		ifFalse:[
		pointer selectedIndex: 0.25.
		^ true.].].

" Top Left"
	(pointer pickSphere: (Vector3 x: dxn y: dy z: 0) radiusSquared: rs) ifTrue:
		[pointer selectedIndex: 0.875.
		^ true.].
" Top Right"
	(pointer pickSphere: (Vector3 x: dx y: dy z: 0) radiusSquared: rs) ifTrue:
		[pointer selectedIndex: 0.125.
		^ true.].
"Bottom Right"
	(pointer pickSphere: (Vector3 x: dx y: dyn z: 0) radiusSquared: rs) ifTrue:
		[pointer selectedIndex: 0.375.
		^ true.].
"Bottom Left"
	(pointer pickSphere: (Vector3 x: dxn y: dyn z: 0) radiusSquared: rs) ifTrue:
		[pointer selectedIndex: 0.625.
		^ true.].
	
	^ false.
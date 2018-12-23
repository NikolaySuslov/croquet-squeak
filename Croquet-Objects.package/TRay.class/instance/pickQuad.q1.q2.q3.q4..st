picking
pickQuad: norm q1: p1 q2: p2 q3: p3 q4: p4

	| pointAt po1 po2 po3 po4 d1 d2 d3 d4 tval |
	pointAt := self framePointer row3.
	norm ifNotNil:[
		((pointAt dot: norm) < 0) ifTrue:[^ false ].].
	po1 := self framePosition - p1.
	po2 := self framePosition - p2.
	po3 := self framePosition - p3.
	po4 := self framePosition - p4.

	d1 := pointAt dot: po1.
	d2 := pointAt dot: po2.
	d3 := pointAt dot: po3.
	d4 := pointAt dot: po4.

" Are any of the points actually in front of the pointer?"
	d1 < 0 ifTrue:[
		d2 < 0 ifTrue:[
			d3 < 0 ifTrue:[
				d4 < 0 ifTrue:[^ false.]]]].

"	(norm dot: po1) > 0 ifTrue:[ ^ false.]."
" If all of the points are further than the current selected distance, then we are done."
	tval := (self testSelectedDistance: d1) +
		(self testSelectedDistance: d2) +
		(self testSelectedDistance: d3) +
		(self testSelectedDistance: d4).
"Are they all behind or all in front?"
	(tval = 4 or:[tval = -4])ifTrue:[^false].

" At some point, I need to write a special pickFrame for quads, because I calculate one of the vertices twice this way. In Squeak, every cycle counts!."
  	(self pickFrame: self framePointer tri: po1 tri: po2 tri: po3) ifFalse:[ 
		(self pickFrame: self framePointer tri: po3 tri: po4 tri: po1) ifFalse:[^ false]].
"	self selectedPoint: (self framePosition - self selectedPoint)."
	self selectedNormal: norm.
	^ true.
	

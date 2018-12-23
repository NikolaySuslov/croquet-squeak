picking
pickTriangle: norm tri: p1 tri: p2 tri: p3

	| pointAt po1 po2 po3 d1 d2 d3 |

	pointAt := self framePointer row3.
	norm ifNotNil:[
		((pointAt dot: norm) < 0) ifTrue:[^ false ].].
	po1 := self framePosition - p1.
	po2 := self framePosition - p2.
	po3 := self framePosition - p3.

" Are any of the points actually in front of the pointer?"
	d1 := pointAt dot: po1.
	d2 := pointAt dot: po2.
	d3 := pointAt dot: po3.
	d1 < 0 ifTrue:[
		d2< 0 ifTrue:[
			d3 < 0 ifTrue:[^ false.]]].

" If all of the points are further than the current selected distance, then we are done."
	((self testSelectedDistance: d1) +
		(self testSelectedDistance: d2) +
		(self testSelectedDistance: d3))abs = 3 ifTrue:[^ false].

	(self pickFrame: self framePointer tri: po1 tri: po2 tri: po3) ifTrue: [
	"	self selectedPoint: (self framePosition - self selectedPoint)."
		self selectedNormal: norm.
		self selectedTriangle: (Array with: p1 with: p2 with: p3).
		^ true.].
	 ^ false.

picking
pickTriangles: vertices list: triList
	"Pick an indexed triangle array"
	| pointAt po1 po2 po3 d1 d2 d3 fp index v0 v1 v2 normal |

	fp := self framePosition.
	pointAt := self framePointer row3.
	index := 0.
	[index < triList size] whileTrue:[
		v0 := vertices at: (triList at: (index := index+1))+1.
		v1 := vertices at: (triList at: (index := index+1))+1.
		v2 := vertices at: (triList at: (index := index+1))+1.
		po1 := fp - v0.
		po2 := fp - v1.
		po3 := fp - v2.

		"Are any of the points actually in front of the pointer?"
		d1 := pointAt dot: po1.
		d2 := pointAt dot: po2.
		d3 := pointAt dot: po3.
		(d1 >= 0.0 or:[d2 >= 0.0 or:[d3 >= 0.0]]) ifTrue:[
			" If all of the points are further than the current selected distance, then we are done."
			((self testSelectedDistance: d1)+
				(self testSelectedDistance: d2)+
				(self testSelectedDistance: d3))abs = 3 ifTrue:[^false].

			(self pickFrame: self framePointer tri: po1 tri: po2 tri: po3) ifTrue: [
				normal := ((po2 - po1) cross: (po3 - po1)) normalized.
			"	self selectedPoint: (self framePosition - self selectedPoint)."
				self selectedNormal: normal.
				self selectedTriangle: (Array with: v0 with: v1 with: v2).
				^ true.
			].
		].
	].
	^false
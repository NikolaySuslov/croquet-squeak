picking
pickPlane: position normal: normal

	| div sp d |

	div := normal dot: self framePointer row3. 
	div = 0 ifTrue:[ ^ false ].
	d := ((position-self framePosition) dot: normal)/div.
	sp:= self framePosition +  (self framePointer row3 * d).
	
	(self testSelectedDistance: d)=0 ifFalse:[^false].
	self selectedDistance: d.
	self selectedPoint: sp.
	self selectedNormal: normal.
	^ true.
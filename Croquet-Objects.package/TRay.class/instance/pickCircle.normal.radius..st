picking
pickCircle: position normal: normal radius: r

	| div sp d |
	div := normal dot: self framePointer row3. 
	div <= 0 ifTrue:[ ^ false ].
	d := ((self framePosition-position) dot: normal)/div.
	sp:= self framePosition -  (self framePointer row3 * d).
	(self testSelectedDistance: d)=0 ifFalse:[^false].
	(sp - position) length > r ifTrue:[^ false ].
	self selectedDistance: d.
	self selectedPoint: sp.
	self selectedNormal: normal.
	^ true.
accessing
length: ln 
	ln > 0 ifTrue:[
	length := ln.
	point translationX: 0.0 y: 0.0 z: arrowLength - length.
	shaft frameChildren do:[ :glow |
		glow extent: radius * 6 @ (0.2 + length - arrowLength).
		glow location: (Vector3 x: 0 y: length - arrowLength / 2.0 z: 0.0).
		].].
	spell ifNotNil:[spell translation:(Vector3 x:0 y: 0 z: length negated).].

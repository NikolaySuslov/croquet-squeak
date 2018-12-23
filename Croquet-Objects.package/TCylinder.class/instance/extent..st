accessing
extent: ext

	| sc rad |
	rad := (topRadius max: baseRadius) * 2.0.
	rad := (ext x- rad)abs > (ext z-rad)abs ifTrue:[ext x/2.0] ifFalse:[ext z/2.0].
	
	sc := rad / (topRadius max: baseRadius).
	topRadius := topRadius * sc.
	baseRadius := baseRadius * sc.
	height := ext y.
	self boundsChanged.

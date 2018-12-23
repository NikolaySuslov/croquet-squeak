rendering
invalidRect: aRectangle from: aMorph
	| damageRect |
	texture ifNil:[^super invalidRect: aRectangle from: aMorph].
	damageRect := aRectangle.
	aMorph == self ifFalse:[
		"Clip to receiver's clipping bounds if the damage came from a child"
		self clipSubmorphs 
			ifTrue:[damageRect := aRectangle intersect: self clippingBounds]].
	damageRecorder recordInvalidRect: (damageRect translateBy: bounds origin negated).
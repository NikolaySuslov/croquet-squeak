accessing
material: mat
	| copy |
	copy := mat copy.
	copy texture: self.
	copy uvScale: self uvScale.
	copy uvAngle: self uvAngle.
	copy uvOffset: self uvOffset.
	super material: copy.

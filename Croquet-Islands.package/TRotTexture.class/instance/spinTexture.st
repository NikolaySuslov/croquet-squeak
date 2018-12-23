as yet unclassified
spinTexture

	angle := angle +1.
	angle >= 360 ifTrue:[angle := 0].
	self uvAngle: angle.
	self uvOffset:0.01@0.01*angle.
	self uvScale:1@1*(angle/60.0).
	(self future:100) spinTexture.

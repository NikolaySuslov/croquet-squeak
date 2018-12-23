accessing
materialAndTexture: mat

	super material: mat copy.
	self checkAlpha.

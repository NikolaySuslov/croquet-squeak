accessing
uploadTexture: aTForm
	| rect |
	rect := aTForm updateRect ifNil:[^self]. "nothing to upload"
	self uploadTexture: aTForm dirtyRect: rect.
	aTForm resetUpdateRect.
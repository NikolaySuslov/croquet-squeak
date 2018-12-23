textures
enableTexture: aTexture
	changeTexture ifFalse:[^false].
	self glEnable: aTexture target.
	^ true.
textures
bindTexture: aTForm
	changeTexture ifFalse:[^false].
	textureManager bindTexture: aTForm.
	^ true.
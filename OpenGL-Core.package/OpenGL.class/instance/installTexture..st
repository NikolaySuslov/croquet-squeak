textures
installTexture: aTForm
	| tf |
	changeTexture ifFalse:[^false].
	"find the real texture if necessary"
	aTForm isThumb 
		ifTrue:[tf := formManager resolve: aTForm distance: distance]
		ifFalse:[tf := aTForm].
	textureManager bindTexture: tf.
	textureManager uploadTexture: tf.
	^ true.
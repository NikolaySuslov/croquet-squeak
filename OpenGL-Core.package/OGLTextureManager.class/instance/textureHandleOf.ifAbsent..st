accessing
textureHandleOf: aTForm ifAbsent: aBlock
	"First, find the real texture if necessary"
	| tf |
	aTForm isThumb 
		ifTrue:[tf := ogl formManager resolve: aTForm distance:ogl distance]
		ifFalse:[tf := aTForm].
	^textures at: tf sha ifAbsent: aBlock
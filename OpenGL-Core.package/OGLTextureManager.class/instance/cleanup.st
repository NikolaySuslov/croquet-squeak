initialize
cleanup
	"clean up any lost references"
	| |
	"first pass - clean up any unreferenced textures"
"	any := false.
	textures associationsDo:[:assoc|
		assoc key == nil ifTrue:[
			handle := assoc value.
			ogl glDeleteTextures: 1 with: (WordArray with: handle glID).
			memUsed := memUsed - handle bytesUsed.
			any := true].
	].
	any ifTrue:[textures finalizeValues]."
	"second pass - if we exceed maxMem of texture space clean up oldest (unused) textures"
	self releaseTextureMemoryIfNeeded.

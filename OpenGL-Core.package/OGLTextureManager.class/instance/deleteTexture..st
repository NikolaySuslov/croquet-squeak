accessing
deleteTexture: aTForm
	| handle |
	handle := textures removeKey: aTForm sha ifAbsent:[nil].
	handle ifNotNil:[
		ogl glDeleteTextures: 1 with: (WordArray with: handle glID).
		memUsed := memUsed - handle bytesUsed.
	].
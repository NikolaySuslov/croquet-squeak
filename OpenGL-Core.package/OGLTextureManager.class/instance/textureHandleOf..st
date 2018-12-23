accessing
textureHandleOf: aTForm
	| handle |
	"Find (or make) the handle. If it has a different objectID from the TForm, remake it."
	handle := textures at: aTForm sha ifAbsentPut:[self setupHandle: aTForm].
	handle objectID = aTForm objectID ifFalse:[
		"To work around a bug in some OpenGL implementations (Panasonic R3 w/ Intel OGL drivers for example) we destroy and recreate the handle here rather than recycling it. That's because on the aforementioned machine we had very strange effects when we tried to switch texture resolutions while using GLGenerateMipmapSGIS when replacing the thumbnails with cached versions."
		textures removeKey: aTForm sha.
		ogl glDeleteTextures: 1 with: (WordArray with: handle glID).
		handle := self setupHandle: aTForm.
		textures at: aTForm sha put: handle.
	].
	^handle.
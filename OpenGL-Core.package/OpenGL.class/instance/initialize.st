initialize
initialize
	"the following makes sure that the FFI link library name is set correctly for this platform"
	self privateInstallLibrary: self openGLLibraryName.
	textureManager := OGLTextureManager new initialize: self.
	glListRegistry := WeakIdentityKeyDictionary new.
	fontManager := OGLFontManager new initialize: self.
	shaderManager := OGLShaderManager new initialize: self.
	timeStamp := 0.
	frontFace := GLCcw.
	maxPortalDepth := 5. "arbitrary value, probably should be less than 8."
	changeTexture := true.
	test := false.
	"instance := 	instance := HPTime getRealTimeAsMilliseconds." "timestamp of this ogl instance"
	isMirror := false.
	portalDepth := 0.		"Counts 2D portal render depth."
	inPortal3D := false.
	self forceWire: false.
	inGLBlock := false.
	forcePick := false.
	forceHilite := nil.
	suppressPortals := false.
	noSwap := false.
	fogOn := false.
	transparency := 1.0.
	bufferObjects := Dictionary new.
	super initialize.
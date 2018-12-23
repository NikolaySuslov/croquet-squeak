GL_EXT_framebuffer_object
generateExtFramebufferObjectFunctions
	"self generateExtFramebufferObjectFunctions"

	self generate: 'GL_EXT_framebuffer_object'
	types: #(
		'handleARB' ulong
		'charARB' char
		'uint' ulong
		'short' short
		'float' float
		'double' double
		'ubyte' unsignedByte
		'byte' byte
		'int' long
		'ushort' unsignedShort
		'enum' long
		'boolean' long
		'sizei' long
		'void' void
	)
	functions: #(
		'boolean IsRenderbufferEXT (uint buffer)'
		'void BindRenderbufferEXT (enum target, uint buffer)'
		'void DeleteRenderbuffersEXT (sizei n, const uint *buffers)'
		'void GenRenderbuffersEXT (sizei n, uint *buffers)'
		'void RenderbufferStorageEXT (enum target, enum internalformat, sizei width, sizei height)'
		'void GetRenderbufferParameterivEXT (enum target, enum pnames, int *params)'
		'boolean IsFramebufferEXT (uint buffer)'
		'void BindFramebufferEXT (enum target, uint buffer)'
		'void DeleteFramebuffersEXT (sizei n, const uint *buffers)'
		'void GenFramebuffersEXT (sizei n, uint *buffers)'
		'enum CheckFramebufferStatusEXT (enum target)'
		'void FramebufferTexture1DEXT (enum target, enum attachment, enum textarget, uint texture, int level)'
		'void FramebufferTexture2DEXT (enum target, enum attachment, enum textarget, uint texture, int level)'
		'void FramebufferTexture3DEXT (enum target, enum attachment, enum textarget, uint texture, int level, int zoffset)'
		'void FramebufferRenderbufferEXT (enum target, enum attachment, enum renderbuffertarget, uint renderbuffer)'
		'void GetFramebufferAttachmentParameterivEXT (enum target, enum attachment, enum pname, int *params)'
		'void GenerateMipmapEXT (enum target)'
	)

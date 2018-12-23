GL_EXT_framebuffer_blit
generateExtFramebufferBlitFunctions
	"self generateExtFramebufferBlitFunctions"

	self generate: 'GL_EXT_framebuffer_blit'
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
		'bitfield' long
		'sizei' long
		'void' void
	)
	functions: #(
		'void BlitFramebufferEXT(int srcX0, int srcY0, int srcX1, int srcY1, int dstX0, int dstY0, int dstX1, int dstY1, bitfield mask, enum filter)'
	)

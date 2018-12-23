GL_EXT_framebuffer_blit
initializeExtFramebufferBlit
	"self initializeExtFramebufferBlit"
	"Initialize EXT_framebuffer_blit constants"

	self install: 'ExtFramebufferBlit' withEXTConstants: #(
		'READ_FRAMEBUFFER_EXT           0x8CA8'
		'DRAW_FRAMEBUFFER_EXT           0x8CA9'
		'READ_FRAMEBUFFER_BINDING_EXT   0x8CA6'
		'DRAW_FRAMEBUFFER_BINDING_EXT   0x8CAA'
	)

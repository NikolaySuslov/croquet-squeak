GL_ARB_pixel_buffer_object
initializeArbPixelBufferObject
		"self initializeArbPixelBufferObject"
	"Initialize ARB_pixel_buffer_object constants."
	self install: 'ArbPixelBufferObject' withEXTConstants: #(
		"glBindBufferARB/glBufferDataARB/glBufferSubDataARB/etc."	
		'PIXEL_PACK_BUFFER_ARB					0x88EB'
		'PIXEL_UNPACK_BUFFER_ARB				0x88EC'

		"glGet"
		'PIXEL_PACK_BUFFER_BINDING_ARB			0x88ED'
		'PIXEL_UNPACK_BUFFER_BINDING_ARB		0x88EF'
	)	
GL_ARB_texture_compression
initializeArbTextureCompression
	"OGLExtManager initialize"
	"Initialize ARB_texture_compression constants"
	self install: 'ArbTextureCompression' withEXTConstants: #(
		"glTexImage/glCopyTexImage"
		'COMPRESSED_ALPHA_ARB				0x84E9'
		'COMPRESSED_LUMINANCE_ARB			0x84EA'
		'COMPRESSED_LUMINANCE_ALPHA_ARB			0x84EB'
		'COMPRESSED_INTENSITY_ARB			0x84EC'
		'COMPRESSED_RGB_ARB				0x84ED'
		'COMPRESSED_RGBA_ARB				0x84EE'

		"glHint/glGet"
		'TEXTURE_COMPRESSION_HINT_ARB			0x84EF'

		"glGetTexLevelParameter"
		'TEXTURE_COMPRESSED_IMAGE_SIZE_ARB		0x86A0'
		'TEXTURE_COMPRESSED_ARB				0x86A1'

		"glGet*"
		'NUM_COMPRESSED_TEXTURE_FORMATS_ARB		0x86A2'
		'COMPRESSED_TEXTURE_FORMATS_ARB			0x86A3'
	)

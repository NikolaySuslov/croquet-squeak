GL_EXT_texture_compression_s3tc
initializeExtTextureCompressionS3tc
	"OGLExtManager initialize"
	"Initialize EXT_texture_compression_s3tc constants"
	self install: 'ExtTextureCompressionS3tc' withEXTConstants: #(
		'COMPRESSED_RGB_S3TC_DXT1_EXT                   0x83F0'
		'COMPRESSED_RGBA_S3TC_DXT1_EXT                  0x83F1'
		'COMPRESSED_RGBA_S3TC_DXT3_EXT                  0x83F2'
		'COMPRESSED_RGBA_S3TC_DXT5_EXT                  0x83F3'
	)

GL_SGIS_generate_mipmap
initializeSgisGenerateMipmap
	"GLExtensions initialize"
	"Initialize SGIS_GENERATE_MIPMAP constants"
	self install: 'SgisGenerateMipmap' withEXTConstants: #(
		'GENERATE_MIPMAP_SGIS		0x8191'
		'GENERATE_MIPMAP_HINT_SGIS	0x8192'
	)

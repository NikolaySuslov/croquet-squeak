GL_ARB_fragment_shader
initializeArbFragmentShader
	"self initializeArbFragmentShader"
	"Initialize ARB_fragment_shader constants"

	self install: 'ArbFragmentShader' withEXTConstants: #(
		'FRAGMENT_SHADER_ARB				0x8B30'
		'MAX_FRAGMENT_UNIFORM_COMPONENTS_ARB		0x8B49'
		'MAX_TEXTURE_COORDS_ARB				0x8871'
		'MAX_TEXTURE_IMAGE_UNITS_ARB			0x8872'
		'FRAGMENT_SHADER_DERIVATIVE_HINT_ARB		0x8B8B'
	).
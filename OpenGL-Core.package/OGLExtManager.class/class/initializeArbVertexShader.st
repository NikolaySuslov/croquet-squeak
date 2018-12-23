GL_ARB_vertex_shader
initializeArbVertexShader
	"self initializeArbVertexShader"
	"Initialize ARB_vertex_shader constants"

	self install: 'ArbVertexShader' withEXTConstants: #(
		'VERTEX_SHADER_ARB 	0x8B31'
		'MAX_VERTEX_UNIFORM_COMPONENTS_ARB 	0x8B4A'
		'MAX_VARYING_FLOATS_ARB 	0x8B4B'
		'MAX_VERTEX_TEXTURE_IMAGE_UNITS_ARB 	0x8B4C'
		'MAX_COMBINED_TEXTURE_IMAGE_UNITS_ARB 	0x8B4D'
		'OBJECT_ACTIVE_ATTRIBUTES_ARB 	0x8B89'
		'OBJECT_ACTIVE_ATTRIBUTE_MAX_LENGTH_ARB 	0x8B8A  '
)
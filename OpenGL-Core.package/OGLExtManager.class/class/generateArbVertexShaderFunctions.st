GL_ARB_vertex_shader
generateArbVertexShaderFunctions
	"self generateArbVertexShaderFunctions"

	self generate: 'GL_ARB_vertex_shader'
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
    		'void BindAttribLocationARB(handleARB programObj, uint index, const charARB *name);'
		'void GetActiveAttribARB(handleARB programObj, uint index, sizei maxLength, sizei *length, int *size, enum *type, charARB *name);'
		'int GetAttribLocationARB(handleARB programObj, const charARB *name);'
	)

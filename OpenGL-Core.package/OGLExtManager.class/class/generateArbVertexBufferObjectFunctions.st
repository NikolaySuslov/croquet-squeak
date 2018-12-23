GL_ARB_vertex_buffer_object
generateArbVertexBufferObjectFunctions
	"self generateArbVertexBufferObjectFunctions"

	self generate: 'GL_ARB_vertex_buffer_object'
	types: #(
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
		'long' long
		'sizeiptrARB' long
		'intptrARB' long
	)
	functions: #(
		'void DeleteBuffersARB(sizei n, const uint *buffers);'
		'void GenBuffersARB(sizei n, uint *buffers);'
		'boolean IsBufferARB(uint buffer);'
		'void BufferDataARB(enum target, sizeiptrARB size, const void *data, enum usage);'
		'void BufferSubDataARB(enum target, intptrARB offset, sizeiptrARB size, const void *data);'
		'void GetBufferSubDataARB(enum target, intptrARB offset, sizeiptrARB size, void *data);'
		'void* MapBufferARB(enum target, enum access);'
		'boolean UnmapBufferARB(enum target);'
		'void GetBufferParameterivARB(enum target, enum pname, int *params);'
		'void GetBufferPointervARB(enum target, enum pname, void **params);'
	)

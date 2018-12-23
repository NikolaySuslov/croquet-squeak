GL_ARB_vertex_program
generateArbVertexProgramFunctions
	"self generateArbVertexProgramFunctions"

Utilities useAuthorInitials: 'bf' during: [
	self generate: 'GL_ARB_vertex_program'
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
	)
	functions: #(
		'void VertexAttrib1sARB(uint index, short x);'
		'void VertexAttrib1fARB(uint index, float x);'
		'void VertexAttrib1dARB(uint index, double x);'
		'void VertexAttrib2sARB(uint index, short x, short y);'
		'void VertexAttrib2fARB(uint index, float x, float y);'
		'void VertexAttrib2dARB(uint index, double x, double y);'
		'void VertexAttrib3sARB(uint index, short x, short y, short z);'
		'void VertexAttrib3fARB(uint index, float x, float y, float z);'
		'void VertexAttrib3dARB(uint index, double x, double y, double z);'
		'void VertexAttrib4sARB(uint index, short x, short y, short z, short w);'
		'void VertexAttrib4fARB(uint index, float x, float y, float z, float w);'
		'void VertexAttrib4dARB(uint index, double x, double y, double z, double w);'
		'void VertexAttrib4NubARB(uint index, ubyte x, ubyte y, ubyte z, ubyte w);'
		'void VertexAttrib1svARB(uint index, const short *v);'
		'void VertexAttrib1fvARB(uint index, const float *v);'
		'void VertexAttrib1dvARB(uint index, const double *v);'
		'void VertexAttrib2svARB(uint index, const short *v);'
		'void VertexAttrib2fvARB(uint index, const float *v);'
		'void VertexAttrib2dvARB(uint index, const double *v);'
		'void VertexAttrib3svARB(uint index, const short *v);'
		'void VertexAttrib3fvARB(uint index, const float *v);'
		'void VertexAttrib3dvARB(uint index, const double *v);'
		'void VertexAttrib4bvARB(uint index, const byte *v);'
		'void VertexAttrib4svARB(uint index, const short *v);'
		'void VertexAttrib4ivARB(uint index, const int *v);'
		'void VertexAttrib4ubvARB(uint index, const ubyte *v);'
		'void VertexAttrib4usvARB(uint index, const ushort *v);'
		'void VertexAttrib4uivARB(uint index, const uint *v);'
		'void VertexAttrib4fvARB(uint index, const float *v);'
		'void VertexAttrib4dvARB(uint index, const double *v);'
		'void VertexAttrib4NbvARB(uint index, const byte *v);'
		'void VertexAttrib4NsvARB(uint index, const short *v);'
		'void VertexAttrib4NivARB(uint index, const int *v);'
		'void VertexAttrib4NubvARB(uint index, const ubyte *v);'
		'void VertexAttrib4NusvARB(uint index, const ushort *v);'
		'void VertexAttrib4NuivARB(uint index, const uint *v);'
		'void VertexAttribPointerARB(uint index, int size, enum type, boolean normalized, sizei stride, const void *pointer);'
		'void EnableVertexAttribArrayARB(uint index);'
		'void DisableVertexAttribArrayARB(uint index);'
		'void ProgramStringARB(enum target, enum format, sizei len, const void *string);'
		'void BindProgramARB(enum target, uint program);'
		'void DeleteProgramsARB(sizei n, const uint *programs);'
		'void GenProgramsARB(sizei n, uint *programs);'
		'void ProgramEnvParameter4dARB(enum target, uint index, double x, double y, double z, double w);'
		'void ProgramEnvParameter4dvARB(enum target, uint index, const double *params);'
		'void ProgramEnvParameter4fARB(enum target, uint index, float x, float y, float z, float w);'
		'void ProgramEnvParameter4fvARB(enum target, uint index, const float *params);'
		'void ProgramLocalParameter4dARB(enum target, uint index, double x, double y, double z, double w);'
		'void ProgramLocalParameter4dvARB(enum target, uint index, const double *params);'
		'void ProgramLocalParameter4fARB(enum target, uint index, float x, float y, float z, float w);'
		'void ProgramLocalParameter4fvARB(enum target, uint index, const float *params);'
		'void GetProgramEnvParameterdvARB(enum target, uint index, double *params);'
		'void GetProgramEnvParameterfvARB(enum target, uint index, float *params);'
		'void GetProgramLocalParameterdvARB(enum target, uint index, double *params);'
		'void GetProgramLocalParameterfvARB(enum target, uint index, float *params);'
		'void GetProgramivARB(enum target, enum pname, int *params);'
		'void GetProgramStringARB(enum target, enum pname, void *string);'
		'void GetVertexAttribdvARB(uint index, enum pname, double *params);'
		'void GetVertexAttribfvARB(uint index, enum pname, float *params);'
		'void GetVertexAttribivARB(uint index, enum pname, int *params);'
		'void GetVertexAttribPointervARB(uint index, enum pname, void **pointer);'
		'boolean IsProgramARB(uint program);'
	)
]
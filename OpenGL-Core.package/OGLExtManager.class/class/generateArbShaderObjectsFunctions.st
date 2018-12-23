GL_ARB_shader_objects
generateArbShaderObjectsFunctions
	"self generateArbShaderObjectsFunctions"

	self generate: 'GL_ARB_shader_objects'
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
		'void DeleteObjectARB(handleARB obj)'
		'handleARB GetHandleARB(enum pname)'
		'void DetachObjectARB(handleARB containerObj, handleARB attachedObj)'
		'handleARB CreateShaderObjectARB(enum shaderType)'
"
		'void ShaderSourceARB(handleARB shaderObj, sizei count, const charARB **string, const int *length)'
"		
		'void ShaderSourceARB(handleARB shaderObj, sizei count, const charARB* string, const int *length)'

		'void CompileShaderARB(handleARB shaderObj)'
		'handleARB CreateProgramObjectARB()'
		'void AttachObjectARB(handleARB containerObj, handleARB obj)'
		'void LinkProgramARB(handleARB programObj)'
		'void UseProgramObjectARB(handleARB programObj)'
		'void ValidateProgramARB(handleARB programObj)'
		'void Uniform1fARB(int location, float v0)'
		'void Uniform2fARB(int location, float v0, float v1)'
		'void Uniform3fARB(int location, float v0, float v1, float v2)'
		'void Uniform4fARB(int location, float v0, float v1, float v2, float v3)'
		'void Uniform1iARB(int location, int v0)'
		'void Uniform2iARB(int location, int v0, int v1)'
		'void Uniform3iARB(int location, int v0, int v1, int v2)'
		'void Uniform4iARB(int location, int v0, int v1, int v2, int v3)'
		'void Uniform1fvARB(int location, sizei count, const float *value)'
		'void Uniform2fvARB(int location, sizei count, const float *value)'
		'void Uniform3fvARB(int location, sizei count, const float *value)'
		'void Uniform4fvARB(int location, sizei count, const float *value)'
		'void Uniform1ivARB(int location, sizei count, const int *value)'
		'void Uniform2ivARB(int location, sizei count, const int *value)'
		'void Uniform3ivARB(int location, sizei count, const int *value)'
		'void Uniform4ivARB(int location, sizei count, const int *value)'
		'void UniformMatrix2fvARB(int location, sizei count, boolean transpose, const float *value)'
		'void UniformMatrix3fvARB(int location, sizei count, boolean transpose, const float *value)'
		'void UniformMatrix4fvARB(int location, sizei count, boolean transpose, const float *value)'
		'void GetObjectParameterfvARB(handleARB obj, enum pname, float *params)'
		'void GetObjectParameterivARB(handleARB obj, enum pname, int *params)'
		'void GetInfoLogARB(handleARB obj, sizei maxLength, sizei *length, charARB *infoLog)'
		'void GetAttachedObjectsARB(handleARB containerObj, sizei maxCount, sizei *count, handleARB *obj)'
		'int GetUniformLocationARB(handleARB programObj, const charARB *name)'
		'void GetActiveUniformARB(handleARB programObj, uint index, sizei maxLength, sizei *length, int *size, enum *type, charARB *name)'
		'void GetUniformfvARB(handleARB programObj, int location, float *params)'
		'void GetUniformivARB(handleARB programObj, int location, int *params)'
		'void GetShaderSourceARB(handleARB obj, sizei maxLength, sizei *length, charARB *source)'
	)

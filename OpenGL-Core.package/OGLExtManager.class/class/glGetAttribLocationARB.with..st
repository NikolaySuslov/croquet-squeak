GL_ARB_vertex_shader
glGetAttribLocationARB: programObj with: name
	"This method was generated by OGLExtManager"
	<apicall: long 'glGetAttribLocationARB' (ulong char*)>
	^self externalCallFailed
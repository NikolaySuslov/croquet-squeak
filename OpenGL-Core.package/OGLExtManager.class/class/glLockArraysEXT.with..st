GL_EXT_compiled_vertex_array
glLockArraysEXT: first with: count
	"void glLockArraysEXT (int first, sizei count)"
	<apicall: void 'glLockArraysEXT' (long long)>
	^self externalCallFailed
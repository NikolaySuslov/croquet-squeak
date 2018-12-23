GL_ARB_transpose_matrix
glMultTransposeMatrixf: m

	"This method was automatically generated."
	"void glMultTransposeMatrixf(GLfloat* m);"
	<apicall: void 'glMultTransposeMatrixf' (float*) >
	^self externalCallFailed
"	^self glMultMatrixf: m transposed."
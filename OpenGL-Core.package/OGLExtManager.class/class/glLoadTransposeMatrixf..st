GL_ARB_transpose_matrix
glLoadTransposeMatrixf: m

	"This method was automatically generated."
	"void glLoadTransposeMatrixf(GLfloat* m);"
	<apicall: void 'glLoadTransposeMatrixf' (float*) >
	^self externalCallFailed
"	^self glLoadMatrixf: m transposed."

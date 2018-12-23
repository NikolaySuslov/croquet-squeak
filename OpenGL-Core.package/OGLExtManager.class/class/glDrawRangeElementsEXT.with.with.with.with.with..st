GL_EXT_draw_range_elements
glDrawRangeElementsEXT: mode with: start with: end with: count with: type with:indices
	"void glDrawRangeElements(GLenum mode, GLuint start, GLuint end, GLsizei count, GLenum type, GLvoid* indices);"
	<apicall: void 'glDrawRangeElementsEXT' (ulong ulong ulong long ulong void*)>
	^self externalCallFailed
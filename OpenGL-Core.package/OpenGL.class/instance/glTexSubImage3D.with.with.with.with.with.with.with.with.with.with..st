Keyword API
glTexSubImage3D: target with: level with: xoffset with: yoffset with: zoffset with: width with: height with: depth with: format with: type with: pixels
	"This method was automatically generated."
	"void glTexSubImage3D(GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLenum type, GLvoid* pixels);"
	<apicall: void 'glTexSubImage3D' (ulong long long long long long long long ulong ulong void*) module: '#openGLLibraryName'>
	^self externalCallFailed
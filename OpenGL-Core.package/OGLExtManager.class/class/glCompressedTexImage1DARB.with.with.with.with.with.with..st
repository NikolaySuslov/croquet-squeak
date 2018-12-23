GL_ARB_texture_compression
glCompressedTexImage1DARB: target with: level with: internalformat with: width with: border with: imageSize with: data
	"void glCompressedTexImage1DARB(enum target, int level,
                                 enum internalformat, sizei width,
                                 int border, sizei imageSize,
                                 const void *data);"
	<apicall: void 'glCompressedTexImage1DARB' (long long long long long long void*)>
	^self externalCallFailed
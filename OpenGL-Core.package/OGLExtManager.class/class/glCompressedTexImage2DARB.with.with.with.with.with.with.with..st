GL_ARB_texture_compression
glCompressedTexImage2DARB: target with: level with: internalformat with: width with: height with: border with: imageSize with: data
	"void glCompressedTexImage2DARB(enum target, int level,
                                 enum internalformat, sizei width,
                                 sizei height,
                                 int border, sizei imageSize,
                                 const void *data);"
	<apicall: void 'glCompressedTexImage2DARB' (long long long long long long long void*)>
	^self externalCallFailed
GL_ARB_texture_compression
glCompressedTexImage3DARB: target with: level with: internalformat with: width with: height with: depth with: border with: imageSize with: data
	"void glCompressedTexImage3DARB(enum target, int level,
                                 enum internalformat, sizei width,
                                 sizei height, sizei depth,
                                 int border, sizei imageSize,
                                 const void *data);"
	<apicall: void 'glCompressedTexImage3DARB' (long long long long long long long long void*)>
	^self externalCallFailed
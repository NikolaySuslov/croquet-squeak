GL_ARB_texture_compression
glCompressedTexSubImage2DARB: target with: level with: xoffset with: yoffset with: width with: height with: aFormat with: imageSize with: data
	"void CompressedTexSubImage2DARB(enum target, int level, 
                                    int xoffset, int yoffset,
                                    sizei width, sizei height,
                                    enum format, sizei imageSize,
                                    const void *data);"
	<apicall: void 'glCompressedTexImage2DARB' (long long long long long long long long void*)>
	^self externalCallFailed
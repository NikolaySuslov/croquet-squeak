GL_ARB_texture_compression
glCompressedTexSubImage1DARB: target with: level with: xoffset with: width with: aFormat with: imageSize with: data
	"void CompressedTexSubImage1DARB(enum target, int level, 
                                    int xoffset, sizei height,
                                    enum format, sizei imageSize,
                                    const void *data);"
	<apicall: void 'glCompressedTexImage2DARB' (long long long long long long void*)>
	^self externalCallFailed
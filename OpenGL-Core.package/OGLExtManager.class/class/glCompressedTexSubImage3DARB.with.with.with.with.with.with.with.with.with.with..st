GL_ARB_texture_compression
glCompressedTexSubImage3DARB: target with: level with: xoffset with: yoffset with: zoffset with: width with: height with: depth with: aFormat with: imageSize with: data
	"void CompressedTexSubImage3DARB(enum target, int level, 
                                    int xoffset, int yoffset,
                                    int zoffset, sizei width,
                                    sizei height, sizei depth,
                                    enum format, sizei imageSize,
                                    const void *data);"
	<apicall: void 'glCompressedTexImage2DARB' (long long long long long long long long long long void*)>
	^self externalCallFailed
GL_ARB_texture_compression
glGetCompressedTexImageARB: target with: lod with: img
	"void GetCompressedTexImageARB(enum target, int lod,
                                    void *img);"
	<apicall: void 'glCompressedTexImage1DARB' (long long void*)>
	^self externalCallFailed
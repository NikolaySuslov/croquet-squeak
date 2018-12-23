GL_ARB_multisample
initializeArbMultisample
	"GLExtensions initialize"
	"Initialize GL_ARB_MULTISAMPLE constants; this is only a small subset"
	self install: 'ArbMutlisample' withEXTConstants: #(
		'MULTISAMPLE_ARB	0x809D'
		'MULTISAMPLE_FILTER_HINT_NV	0x8534'
	)

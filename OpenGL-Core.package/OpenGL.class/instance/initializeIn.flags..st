initialize
initializeIn: bounds flags: flags
	"flag is a bitwise OR of
	1	B3DSoftwareRenderer
	2	B3DHardwareRenderer
	4	B3DStencilBuffer
	8	B3DAntialiasing
	16	B3DStereo
	32	B3DSyncvbl"
	handle := self primCreateRenderer: flags x: bounds left y: bounds top w: bounds width h: bounds height.
	bufRect := bounds.
	handle ifNotNil: [glExt := OGLExtManager new ogl: self].
	^handle ifNotNil: [self]
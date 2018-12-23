render
enable: ogl
	"TTexture overrides parent implementation (since this is a port of old code to a new framework), but eventually should work within the framework."

	(tform notNil and: [ogl installTexture: tform]) ifTrue:[
		ogl glEnable: GLTexture2d.
	
		isPremultiplied ifTrue: [
			ogl glPushAttrib: GLColorBufferBit.
			ogl glBlendFunc: GLOne with: GLOneMinusSrcAlpha.
		].
		ogl glTexParameteri: GLTexture2d with: GLTextureWrapS with:GLRepeat;
			glTexParameteri: GLTexture2d with: GLTextureWrapT with:GLRepeat.

		ogl glTexEnvi: GLTextureEnv with: GLTextureEnvMode with: textureMode.

		textureMatrix ifNotNil:[
			ogl glMatrixMode:GLTexture;
				glPushMatrix;
				glLoadTransposeMatrixf: textureMatrix;
				glMatrixMode: GLModelview.
		].
	].

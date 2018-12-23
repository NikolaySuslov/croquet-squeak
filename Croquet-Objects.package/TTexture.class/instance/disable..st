render
disable: ogl
	"TTexture overrides parent implementation (since this is a port of old code to a new framework), but eventually should work within the framework."

	(tform notNil & ogl changeTexture) ifFalse:[^false].
	isPremultiplied ifTrue: [
		ogl glPopAttrib.
	].
	textureMatrix ifNotNil: [
		ogl glTexEnvi: GLTextureEnv with: GLTextureEnvMode with: GLModulate;
			glMatrixMode:GLTexture;
			glPopMatrix;
			glMatrixMode: GLModelview.
	].
	ogl glDisable: GLTexture2d.

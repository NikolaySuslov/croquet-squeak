accessing
uploadTexture: aTForm dirtyRect: aRectangle
	"TODO: Later only upload the dirty portion"
	| handle form level scaledSize dirtyRect autoMip internalFormat byteSize format |

	autoMip := aTForm bMipmap and:[ogl autoMipmap].

	handle := self textureHandleOf: aTForm.
	handle timeStamp: ogl timeStamp.
	form := aTForm textureForm.
	form unhibernate.
	dirtyRect := aRectangle.
	aTForm isStatic ifTrue:[
		"Static (possibly compressed) textures typically require complete uploads;
		as they don't change often just upload everything."
		dirtyRect := 0@0 extent: aTForm textureForm extent.
	].
	dirtyRect := dirtyRect intersect: form boundingBox.
	ogl glBindTexture: aTForm target with: handle glID.
	ogl glTexParameteri: GLTexture2d with: GLTextureMinFilter with: aTForm minFilter.
	ogl glTexParameteri: GLTexture2d with: GLTextureMagFilter with: aTForm magFilter.
	autoMip ifTrue:[ogl glTexParameteri: GLTexture2d with: GLGenerateMipmapSGIS with: true].
	"aTForm parameters keysAndValuesDo: [:pname :param |
		ogl glTexParameteri: aTForm target  with: pname with: param]."

	"TODO: This would be the right place to figure out what the initial size of the texture should be given that we're already low on texture memory."
	handle scaledSize: aTForm trueExtent.
	scaledSize := handle scaledSize.

	"specific optimization for morphic textures"
	(dirtyRect extent ~= form extent "needed since first-time upload *must* use glTexImage2D"
		and:[form depth = 32 "needed since we only upload 32bpp forms"
		and:[scaledSize = form extent "needed since we don't scale here"
		and:[autoMip or:[aTForm bMipmap not "only allow for non-mipmaps"]]]]) ifTrue:[
			ogl glPixelStorei: GLUnpackRowLength with: form width.
			ogl glPixelStorei: GLUnpackSkipRows with: dirtyRect top.
			ogl glPixelStorei: GLUnpackSkipPixels with: dirtyRect left.
			ogl glTexSubImage2D: aTForm target with: 0 
				with: dirtyRect left with: dirtyRect top 
				with: dirtyRect width with: dirtyRect height 
				with: ogl texturePixelFormat with: ogl texturePixelType 
				with: form bits.
			ogl glPixelStorei: GLUnpackRowLength with: 0.
			ogl glPixelStorei: GLUnpackSkipRows with: 0.
			ogl glPixelStorei: GLUnpackSkipPixels with: 0.
			^self].

	level := 0.
	"figure out the internal format to use"
	internalFormat := ogl textureInternalFormat.
	aTForm isStatic ifTrue:[
		(ogl hasExtension: #'GL_ARB_texture_compression') ifTrue:[
			"internalFormat := ogl textureInternalFormatCompressed."
		].
		byteSize := 0.
	].

	[
		format := internalFormat.

		(compressTextures) ifTrue: [ format := GLCompressedRgbaS3tcDxt5EXT ]. "$$ assumes RGBA, shouldn't actually do this for real-time textures"

		form := self scaleTexture: form to: scaledSize.
		ogl glTexImage2D: aTForm target 
			with: level 
			with: format
			with: form width with: form height 
			with: 0 
			with: ogl texturePixelFormat 
			with: ogl texturePixelType 
			with: form bits.
		aTForm isStatic ifTrue:[
			byteSize := byteSize + (self compressedSizeOf: aTForm at: level form: form).
		].
	autoMip not 
		and:[aTForm bMipmap 
		and:[scaledSize x > 1 or:[scaledSize y > 1]]]] whileTrue:[
			scaledSize := (scaledSize // 2) max: (1@1).
			level := level + 1.
	].

	aTForm isStatic ifTrue:[
		memUsed := memUsed - handle bytesUsed.
		memFrame := memFrame - handle bytesUsed.
		handle bytesUsed: byteSize.
		memUsed := memUsed + handle bytesUsed.
		memFrame := memFrame + handle bytesUsed.
	].

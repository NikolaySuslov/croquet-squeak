private
compressedSizeOf: aTForm at: level form: aForm
	(ogl glGetTexLevelParameteri: aTForm target
		with: level
		with: GLTextureCompressedARB) = 0 ifTrue:[
			"texture was not compressed"
			^aForm width * aForm height * 4.
	].
	^ogl glGetTexLevelParameteri: aTForm target
		with: level
		with: GLTextureCompressedImageSizeARB
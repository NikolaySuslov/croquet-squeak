initialize
releaseTextureMemoryIfNeeded
	"Release some textures if we exceed a certain space usage"
	| maxMem list sha |
	true ifTrue:[^self]. "doesn't *quite* work yet"
	"set upper memory bound"
	maxMem := 32*1024*1024. "for testing - set this to zero to force uploads on every frame"
	"Make sure we don't release anything if we needed it all in the current frame.
	Leave a bit of headroom for sudden changes in direction too."
	maxMem := maxMem max: memFrame + (4*1024*1024).
	memUsed > maxMem ifFalse:[^self].
	list := textures values asArray sort:[:h1 :h2| 
		h1 timeStamp = h2 timeStamp
			ifTrue:[h1 bytesUsed >= h2 bytesUsed]
			ifFalse:[h1 timeStamp < h2 timeStamp].
	].
	list do:[:handle|
		sha := textures keyAtIdentityValue: handle.
		textures removeKey: sha.
		ogl glDeleteTextures: 1 with: (WordArray with: handle glID).
		memUsed := memUsed - handle bytesUsed.
		memUsed < maxMem ifTrue:[^self].
	].

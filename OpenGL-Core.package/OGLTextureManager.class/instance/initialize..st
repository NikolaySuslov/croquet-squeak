initialize
initialize: gl
	ogl := gl.
	textures := Dictionary new.
	memAvail := 16*1024*1024.
	memUsed := 0.
	memFrame := 0.
	compressTextures := false.
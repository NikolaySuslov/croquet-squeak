Class TextureHandle represents a texture handle for internal use by the texture manager.

Instance variables:
	glID			<Integer>	The 'texture name' of OpenGL associated with this texture
	target		<Integer>	The OpenGL target (e.g., GLTexture2d)
	timeStamp	<Integer>	The stamp for the frame when this texture was last used
	scaledSize	<Point>		The ultimate size the texture needs to be scaled to (power of two)
	bytesUsed	<Integer>	The number of bytes associated with this texture on the graphics hardware
	allocated 	<Boolean>	True if the texture is currently allocated on the graphics hardware, false if not.
	displayLists <Set> 		Set of all of the OGL display lists that use this texture
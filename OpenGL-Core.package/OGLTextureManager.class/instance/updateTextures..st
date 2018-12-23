accessing
updateTextures: updateList
	updateList do:[:tf | 
		"upload the new texture for the current texture handle"
		self uploadTexture: tf. 
	].
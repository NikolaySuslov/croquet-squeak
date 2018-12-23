updating
changed
	menuForm ifNotNil:[
		menuForm := nil.
		self future updateMenuStructure.
	].
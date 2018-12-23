copying
postCopy

	super postCopy.
	materialList ifNotNil:[
		materialList := materialList collect:[:mat| mat copy].
	].
	self vertices: self vertices copy.
	self boundsChanged.
	^ self.
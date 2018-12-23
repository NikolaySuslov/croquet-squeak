export
exportSpecial: special
	dataStream nextPut: CodeSpecial.
	self export: (splObjects at: special).
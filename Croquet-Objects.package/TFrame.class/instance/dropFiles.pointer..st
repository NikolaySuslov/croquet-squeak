events
dropFiles: aFileStream pointer: pointer 
	self
		signal: #dropFiles
		with: pointer
		with: aFileStream
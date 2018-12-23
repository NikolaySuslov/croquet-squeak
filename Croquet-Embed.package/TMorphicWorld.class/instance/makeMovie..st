initialize
makeMovie: uri
	| morph |
	morph := TMpegDisplayMorph new.
	morph openFileNamed: (FileDirectory default pathFromURI: uri).
	self makeWorld: morph.
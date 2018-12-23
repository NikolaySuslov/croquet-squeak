initialize
makeMovieFromURI: uri
	| morph |
	morph := TMpegDisplayMorph new.
	morph openFileNamed: uri.
	self makeWorld: morph.
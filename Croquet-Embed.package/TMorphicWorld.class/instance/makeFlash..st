initialize
makeFlash: uri
	| player |
	player := (FlashMorphReader on: (FileStream readOnlyFileNamed: 
			(FileDirectory pathFromURI: uri))) processFile.
	player useTimeSync: false.
	player color: Color transparent.
	player startPlaying.
	player lock.
	self makeWorld: player.
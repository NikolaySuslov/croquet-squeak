instance creation
makeFlash: uri extent: worldExtent from: tform
	| host player |
	player := (FlashMorphReader on: (FileStream readOnlyFileNamed: 
			(FileDirectory pathFromURI: uri))) processFile.
	player useTimeSync: false.
	player color: Color transparent.
	player startPlaying.
	player lock.
	host := self new initializeWithMorph: player thumb: tform extent: worldExtent.
	host redraw.
	TMorphicForm registerHost: host.
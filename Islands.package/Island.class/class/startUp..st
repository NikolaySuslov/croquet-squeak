system startup
startUp: resuming
"on resume from disk, reinitialize the random streams, so that two copies of the image don't have identical random streams. I believe this is correct for replicated TIslands as well, as a TIsland that survives a save and resume is definitely not connected to a router, synced, or even able to run in the current implementation, I believe"

	resuming ifTrue: [self allSubInstancesDo: [:ea | ea initializeRandomStream]]
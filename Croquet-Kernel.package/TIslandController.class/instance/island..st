accessing
island: anIsland
	self shutdownIslandSignalHandlers.
	island := anIsland.
	self setupIslandSignalHandlers.
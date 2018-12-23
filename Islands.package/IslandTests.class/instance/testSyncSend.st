tests-simple
testSyncSend
	| remote localIsland remoteIsland |
	localIsland := Processor activeIsland.
	remoteIsland := Island new.
	remote := remoteIsland new: self class.
	self deny: localIsland isFarRef.
	self assert: remoteIsland isFarRef.
	self assert: remote isFarRef.

	self assert: 24 = (self assertIslandIs: localIsland).
	self assert: 24 = (remote assertIslandIs: remoteIsland).
	self assert: 24 = (remote assertIslandIs: remoteIsland andSignal: Notification).

	self assert: 24 = ([remote assertIslandIs: remoteIsland andSignalChecking: Error]
		on: Error do: [:ex |
			self assertIslandIs: localIsland.
			ex resumeUnchecked: 42]).
	
	self assertIslandIs: localIsland.

	self assert: 24 = ([remote assertIslandIs: remoteIsland andSignalChecking: Notification]
		on: Notification do: [:ex |
			self assertIslandIs: localIsland.
			ex resume: 42]).
	
	self assertIslandIs: localIsland.

	self assert: 12 = ([remote assertIslandIs: remoteIsland andSignalChecking: Error]
		on: Error do: [:ex |
			self assertIslandIs: localIsland.
			12]).
	
	self assertIslandIs: localIsland.

	self assert: 12 = ([remote assertIslandIs: remoteIsland andSignalChecking: Error]
		on: Error do: [:ex |
			self assertIslandIs: localIsland.
			ex retryUsing: [12]]).
	
	self assertIslandIs: localIsland.

	self assert: 24 = ([[remote assertIslandIs: remoteIsland andSignalChecking: Error]
		on: Error do: [:ex |
			self assertIslandIs: localIsland.
			UnhandledError signalForException: ex]]
		on: UnhandledError do: [:ex | 
			self assertIslandIs: localIsland.
			ex exception resumeUnchecked: 42]).
	
	self assertIslandIs: localIsland.


assertions
assertIslandIs: anIsland andSignalChecking: anException
	^ [[
		self assertIslandIs: anIsland.
		self assert: anException signal = 42.
		self assertIslandIs: anIsland.
		24
	] on: anException do: [:ex |
		self assertIslandIs: anIsland.
		ex pass]
	] on: UnhandledError do: [:ex |
		self assertIslandIs: anIsland.
		ex pass]
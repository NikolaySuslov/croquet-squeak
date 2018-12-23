assertions
assertIslandIs: anIsland andSignal: anException
	^ [[
		self assertIslandIs: anIsland.
		anException signal.
		self assertIslandIs: anIsland.
		24
	] on: anException do: [:ex |
		self assertIslandIs: anIsland.
		ex pass]
	] on: UnhandledError do: [:ex |
		self assertIslandIs: anIsland.
		ex pass]
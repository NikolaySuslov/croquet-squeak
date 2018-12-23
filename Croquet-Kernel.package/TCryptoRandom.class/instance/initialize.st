initialize
initialize
	super initialize.
	pool := WordArray new: PoolWords.
	poolIndex := 1.
	rotate := 0.
	entropy := 0.
	lastTick := 0.
	lastDelta := 0.
	self addTimerRandomness: Processor activeIsland totalSeconds.

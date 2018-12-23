*Script-Preload
primitiveWait
	"Schedule this Delay, then wait on its semaphore. The current process will be suspended for the amount of time specified when this Delay was created."
	self schedule.
	[delaySemaphore primitiveWait] ifCurtailed:[self unschedule].
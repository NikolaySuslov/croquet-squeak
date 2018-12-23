render
step

	"I use stepping to govern the rate at which the nested Morphic world
	 gets compute cycles.  #startStepping, called from render, starts fast-rate stepping
	 when I first appear onscreen, if I haven't been started already."

	stepping ifFalse: [
		^ self.
	].
	
	self liveUpdate.
	(self future:rate) step.

	"If render calls startStepping before my next step,
	 the following will be overridden; 
	 this is how we vary the refresh rate for onscreen versus offscreen."
	rate := self offscreenRate.
	
stepping
step
	"Post an update message to the underlying app"
	stepRate <= 0 ifTrue:[^nil].
	self signal: #step with: Processor activeIsland time with: self.
	(self future: stepRate) step.
	"If render calls startStepping before my next step, the following will be overridden; 
	this is how we vary the refresh rate for onscreen versus offscreen."
	stepRate := self offscreenRate.

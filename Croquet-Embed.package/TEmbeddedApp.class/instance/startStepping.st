stepping
startStepping
	self stopStepping.
	stepRate := self offscreenRate.
	self step.

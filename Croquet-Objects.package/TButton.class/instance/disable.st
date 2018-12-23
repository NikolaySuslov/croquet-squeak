action
disable
	persist ifFalse:[
		animateTime := self now + self fadeDelay.
		self startStepping.
	].

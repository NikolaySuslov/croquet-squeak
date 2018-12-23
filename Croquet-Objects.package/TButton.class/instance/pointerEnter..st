events
pointerEnter: event

	self enable.
	persist ifTrue:[self startStepping].
	self color: TButton hiliteColor.
	spin ifTrue:[
		deltaSpin := -1.
		doSpin := doSpin + deltaSpin.
	].
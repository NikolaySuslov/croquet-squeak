driving
drive

	sticky := false.
	controlPitch
		ifTrue: [self pitch: (speedControl y * 25 min: 75 max: -75)]
		ifFalse: [ self forwardOnY: (speedControl y) negated.].
	self addYaw: (speedControl x * 4).

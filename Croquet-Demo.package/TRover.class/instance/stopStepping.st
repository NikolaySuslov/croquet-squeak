stepping
stopStepping

	doStep ifTrue:[
		speed := 0.0.
		wheelRotSpeed := 0.0.
		turnSpeed := 0.0.
		self updateTurn.
		doStep := false.
		wheelRays do:[ :wr | wr setAutomatic: false.].
	].
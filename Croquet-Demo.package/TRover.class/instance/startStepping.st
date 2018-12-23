stepping
startStepping

	doStep ifFalse:[
		doStep := true.
		wheelRays do:[ :wr | wr setAutomatic: true.].
		self step.
	].
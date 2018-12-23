stepping
start

	doStep ifFalse:[
		doStep := true.
		self step.
	].
stepping
startStepping
	stepping ifFalse:[
		stepping := true.
		self step].
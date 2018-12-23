startStepping
	stepping ifFalse:[
		stepping := true.
		(self future: 200) step
	].
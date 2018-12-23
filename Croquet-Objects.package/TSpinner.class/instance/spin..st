accessing
spin: aNumber
	spin := aNumber.
	stepping ifFalse:[
		stepping := true.
		self step.
	].
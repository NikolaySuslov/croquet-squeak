accessing
value: val
	val isInteger ifTrue:[
		(val >=1 and: [val <= 7]) ifTrue: [
		self depth: val.].].

actions
impulse: index
	(index >=1 and:[index <= (surface size - (size x+1))]) ifTrue:[
			surface at: index put: 2.0.
			surface at: index+1 put: 2.0.
			surface at: index + size x put: 2.0.
			surface at: index + size x + 1 put: 2.0. ].
	countDown := 300.
	stepping ifFalse:[
		stepping := true.
		self step].
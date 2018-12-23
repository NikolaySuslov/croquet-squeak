accessing
start

	start ifTrue:[^ self].
	self root ifNotNilDo:[:rt| rt addChild: tracer]. 
	start := true.
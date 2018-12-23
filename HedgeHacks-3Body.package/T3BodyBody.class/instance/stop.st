accessing
stop

	start ifFalse:[^ self].
	tracer reset.
	self root ifNotNilDo:[:rt| rt removeChild: tracer]. 
	start := false.
	stepRemainder := 0.
accessing
pitch: p

	super pitch: p.
	costume ifNotNil:[
		costume pitch: p negated.
	].
	lockStep := true.
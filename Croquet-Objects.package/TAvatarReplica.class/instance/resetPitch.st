accessing
resetPitch

	costume ifNotNil:[
		costume pitch: self pitch negated.
	].
	lockStep := true.
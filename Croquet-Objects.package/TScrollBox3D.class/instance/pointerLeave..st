events
pointerLeave: event

	selectedFrame ifNil:[^self].
	selectedFrame frameChildren do:[:fc | fc material: matNorm.].
	selectedFrame := nil.
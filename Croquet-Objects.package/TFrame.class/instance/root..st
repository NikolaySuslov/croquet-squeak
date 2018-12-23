accessing
root: rt

	frameRoot ifNotNil:[frameRoot removeFrame: self].
	frameRoot := rt.
	frameRoot ifNotNil:[frameRoot addFrame: self].
	frameChildren ifNotNil:[frameChildren do:[:fc | fc root: rt].].
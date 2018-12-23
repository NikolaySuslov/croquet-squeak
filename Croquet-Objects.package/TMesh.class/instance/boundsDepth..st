accessing
boundsDepth: depth

	boundsDepth := depth.
	frameChildren ifNotNil:[ frameChildren do:[ :fc | fc boundsDepth: depth].].
	self boundsChanged.

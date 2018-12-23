picking
frame: frame pickSphere: loc radiusSquared: rs

	| rval |
	
	self testDistance: false.
	self currentFrame: frame.
	rval := self pickSphere: loc radiusSquared: rs.
	self testDistance: true.
	^ rval


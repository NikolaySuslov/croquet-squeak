picking
frame: frame pickTriangle: p1 tri: p2 tri: p3
	| rval |
	self testDistance: false.
	self currentFrame: frame. 
	rval := self pickTriangle: p1 tri: p2 tri: p3.
	self testDistance: true.
	^ rval.

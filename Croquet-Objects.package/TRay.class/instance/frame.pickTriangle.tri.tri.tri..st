picking
frame: frame pickTriangle: norm tri: p1 tri: p2 tri: p3
	| rval |
	self testDistance: false.
	self currentFrame: frame. 
	rval := self pickTriangle: norm tri: p1 tri: p2 tri: p3.
	self testDistance: true.
	^ rval.

picking
frame: frame pickQuad: norm q1: p1 q2: p2 q3: p3 q4: p4
	| rval |
	self testDistance: false.
	self currentFrame: frame. 
	rval := self pickQuad: norm q1: p1 q2: p2 q3: p3 q4: p4.
	self testDistance: true.
	^ rval.

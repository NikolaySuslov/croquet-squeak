picking
frame: frame pickFrontPlane: position normal: normal
	| rval |
	self testDistance: false.
	self currentFrame: frame. 
	rval := self pickFrontPlane: position normal: normal.
	self testDistance: true.
	^ rval.

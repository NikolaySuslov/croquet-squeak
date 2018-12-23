picking
frame: frame pickPlane: position normal: normal
	| rval |
	self testDistance: false.
	self currentFrame: frame. 
	rval := self pickPlane: position normal: normal.
	self testDistance: true.
	^ rval.

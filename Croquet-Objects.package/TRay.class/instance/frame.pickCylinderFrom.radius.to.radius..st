picking
frame: frame pickCylinderFrom: pnt1 radius: rad1 to: pnt2 radius: rad2
	| rval |
	self testDistance: false.
	self currentFrame: frame. 
	rval := self pickCylinderFrom: pnt1 radius: rad1 to: pnt2 radius: rad2.
	self testDistance: true.
	^ rval.

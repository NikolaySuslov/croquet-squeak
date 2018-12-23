picking
frame: frame pickRightCylinderFrom: pnt1 to: pnt2 radius: rad
	| rval |
	self testDistance: false.
	self currentFrame: frame. 
	rval := self pickRightCylinderFrom: pnt1 to: pnt2 radius: rad.
	self testDistance: true.
	^ rval.

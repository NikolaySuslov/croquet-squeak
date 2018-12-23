accessing
setSpeed: spd

	speed := spd.
	speed abs < (deltaSpeed/2.0) ifTrue:[speed := 0.0. self stopStepping.]ifFalse:[ self startStepping.].
	wheelRotSpeed := (speed/wheelRadius) radiansToDegrees negated.
	self updateTurn.

accessing
updateTurn

	| turnRadius |
	turn = 0 ifTrue:[turnSpeed := 0.] ifFalse:[
		turn > 0 ifTrue:[ turnRadius := (wheelBase/2.0) * ((90-turn) degreesToRadians tan).]
		ifFalse:[turnRadius := (wheelBase/2.0) * ((90+turn) degreesToRadians tan negated).].
		turnSpeed := (speed/turnRadius) radiansToDegrees.
	].

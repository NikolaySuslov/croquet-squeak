events
keyStroke: event

	| c v |
	v := event keyValue.
	c := event keyCharacter.

	(c asLowercase = $i ) ifTrue:[ "inspect current state"
		self inspect.
		].
	(v = 30 or:[ c asLowercase = $f ]) ifTrue:[ "move forward" 
		self setSpeed: (speed + deltaSpeed).
		].
	(v = 31 or:[ c asLowercase = $b ])ifTrue:[ "move backwards" 
		self setSpeed: (speed - deltaSpeed).
		].
	(v = 28 or:[ c asLowercase = $l ]) ifTrue:[ "turn left" 
		self setTurn: (turn + 1).
		].
	(v = 29 or:[ c asLowercase = $r ]) ifTrue:[ "turn right" 
		self setTurn: (turn - 1).
		].
	v = 32 ifTrue:[ "stop" 
		self stopStepping.
		].

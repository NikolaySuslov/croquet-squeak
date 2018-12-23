accessing
setTurn: trn

	turn := trn.
	turn > 45 ifTrue:[turn := 45].
	turn < -45 ifTrue:[turn := -45].
	frontTurn do:[ :ft | ft rotationAroundY: turn.].
	rearTurn do:[ :ft | ft rotationAroundY:( turn negated)].
	self updateTurn.

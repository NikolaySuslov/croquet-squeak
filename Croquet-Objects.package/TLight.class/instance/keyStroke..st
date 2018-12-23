events
keyStroke: evt

	| c |
	c := evt keyValue asCharacter.
	c = $p ifTrue:[ self type: #point.].
	c = $d ifTrue:[ self type: #directional.].
	c = $s ifTrue:[ self type: #spot.].

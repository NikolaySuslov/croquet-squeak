events
keyDown: pointer

	| c |
	c := pointer event2D keyCharacter.
	c = $d ifTrue:[self delete.].
	c = $@ ifTrue:[self duplicate.].
	pointer event2D keyValue= 28 ifTrue:[ self selectLeftSibling. ]. "left arrow"
	pointer event2D keyValue= 29 ifTrue:[ self selectRightSibling.]. "right arrow"
	pointer event2D keyValue= 30 ifTrue:[ self selectParent. ]. "up arrow"
	pointer event2D keyValue= 31 ifTrue:[ self selectChild. ]. "down arrow"
	^ true.
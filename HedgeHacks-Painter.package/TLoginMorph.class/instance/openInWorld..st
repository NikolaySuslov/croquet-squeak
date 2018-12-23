initialize
openInWorld: aWorld
	super openInWorld: aWorld.
	aWorld primaryHand newKeyboardFocus: theNameMorph.
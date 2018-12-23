accessing
resetSelected

	doSelect ifTrue:[
		lastSelection := selection.
		selection := self newSelection.
		selection distance: Float infinity.
	] ifFalse: [
		currentFrame := self selectedFrame.
		framePosition := nil.
		framePointer := nil.
	].
	self maxDistance: Float infinity.

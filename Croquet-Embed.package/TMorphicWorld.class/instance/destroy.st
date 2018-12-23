initialize
destroy

	morph ifNotNil:[morph delete. morph := nil].
	world ifNotNil: [
		"Transcript cr; show: 'Embedded morphic application closed.'."
		world delete.
		world := nil.
		hands := nil.
	].
	super destroy.
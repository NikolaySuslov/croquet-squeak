events
pointerEnter: event

	selectedFrame := event selection frame parent.
	selectedFrame = self ifTrue:[selectedFrame := nil. ^self].
	(selectedFrame hasAncestorOrMe: contents) ifTrue:[selectedFrame := nil. ^self].

	selectedFrame frameChildren do:[:fc | fc material: matHilite.].

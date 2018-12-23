events
pointerUp: event

	selectedFrame ifNotNil:[
		selectedFrame frameChildren do:[:fc | fc material: matOver.].
		deferScale ifTrue:[newScale ~= 1.0 ifTrue:[
			contents scale: baseScale *newScale.
	 		box := self getBox: contents.
		]].
		self parentChanged: contents.
		changed := true.
		selectedAction := nil.
		self updateBox.
	].
	selectedFrame := nil.
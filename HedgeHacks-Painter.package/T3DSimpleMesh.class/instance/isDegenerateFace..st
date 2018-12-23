testing
isDegenerateFace: f
	(f at: 1) = (f at: 2) ifTrue:[^true].
	(f at: 2) = (f at: 3) ifTrue:[^true].
	(f at: 3) = (f at: 1) ifTrue:[^true].
	^false
accessing
hasAlpha

	(diffuseColor at: 4) < 1.0 ifTrue: [^ true].
	transparency < 1.0 ifTrue:[^ true].
	^ false.
accessing
isDegenerate
	vertices size = 3 ifFalse:[^false].
	(vertices at: 1) position = (vertices at: 2) position ifTrue:[^true].
	(vertices at: 2) position = (vertices at: 3) position ifTrue:[^true].
	(vertices at: 1) position = (vertices at: 3) position ifTrue:[^true].
	^false
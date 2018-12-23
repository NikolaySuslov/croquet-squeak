accessing
addAlpha: ao
	alphaObjects class == Array ifTrue:[^self].
alphaObjects add: ao.

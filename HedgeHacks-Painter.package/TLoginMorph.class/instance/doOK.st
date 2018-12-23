actions
doOK

	| user password |
	user := theNameMorph contents string.
	password := thePasswordMorph contents string.
	(actionBlock value: user value: password) ifTrue:[self delete].
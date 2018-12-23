accessing
pick: bnds

	focusSelected ifNil:[ ^ super pick: bnds].
	bnds ifNil:[^ false ].
	bnds frame objectOwner = focusSelected ifTrue:[
		^super pick: bnds.].
	^ false.

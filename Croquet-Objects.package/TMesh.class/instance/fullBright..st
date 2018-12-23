accessing
fullBright: bool

	super fullBright: bool.
	materialList ifNotNil:[ materialList do:[ :ml | ml fullBright: bool]].
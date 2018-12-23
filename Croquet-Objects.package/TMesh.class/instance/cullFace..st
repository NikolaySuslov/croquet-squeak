accessing
cullFace: bool

	super fullBright: bool.
	materialList ifNotNil:[ materialList do:[ :ml | ml cullFace: bool]].
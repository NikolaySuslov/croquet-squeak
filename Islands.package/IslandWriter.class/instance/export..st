export
export: obj
	(splObjects includesKey: obj)
		ifTrue:[self exportSpecial: obj]
		ifFalse:[obj exportOnIslandWriter: self].

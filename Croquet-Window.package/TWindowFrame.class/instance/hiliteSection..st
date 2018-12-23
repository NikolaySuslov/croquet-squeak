accessing
hiliteSection: hval
	hiliteSection = hval ifTrue:[^self].
	hiliteSection := hval.
	hiliteSection ifNotNil: [materialHilite texture uvOffset: hiliteSection@0].
geometry
ownerChanged
	self left > owner left ifTrue:[self left: owner left].
	self top > owner bottom ifTrue:[self top: owner bottom - 16].
	self bottom < owner bottom ifTrue:[self top: owner bottom - 16].
	self extent x = owner extent x ifFalse:[super extent: owner extent x @ scroller height + 32].
update
update
	world ifNil:[^self].
	updating ifTrue:[^self]. "avoid recursion"
	updating := true.
	[
		world runLocalStepMethods.
		(world canvas isKindOf: TWorldCanvas) ifFalse:[world canvas: (TWorldCanvas on: self)].
		world privateOuterDisplayWorld.
	] ensure:[updating := false].
	self forceDisplayUpdate.

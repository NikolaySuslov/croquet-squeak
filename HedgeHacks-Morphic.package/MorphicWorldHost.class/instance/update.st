update
update

	world ifNil:[^self].
	updating ifTrue:[^self]. "avoid recursion"
	updating := true.
	[
		self processEvents.
		[world runLocalStepMethods] on: RequestProjectOwner do:[:ex| ex resume: self].
		world canvas ifNil:[world canvas: (TWorldCanvas on: self)].
		world privateOuterDisplayWorld.
	] ensure:[updating := false].
	tform updateRect ifNotNil:[TFormManager default substituteForm: tform].
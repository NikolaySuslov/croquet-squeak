stepping and presenter
step

	super step.
	(self hasProperty: #suppressStepping) ifFalse:[
		[harness 
			ifNil:[self setup]
			ifNotNil:[harness step].
		] ensure:[(self isInWorld and:[self isStepping not]) ifTrue:[self startStepping]].
	].
	self changed.
accessing
driveStep
	self stillAlive.
	driving ifTrue:[self drive].
	sticky ifFalse:[self fall].

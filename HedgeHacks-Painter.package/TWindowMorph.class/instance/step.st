stepping
step
	super step.
	self model ifNotNilDo:[:m| m step].
events
pointerUp: event

	matNorm ifNotNil:[contents material: matNorm.].
	tinyCube visible: false.
	lastSpin ifNotNil:[
		(lastSpin squaredErrorDistanceTo: Matrix4x4 identity)<0.001 ifTrue:[lastSpin := nil].
	].
	self spin: lastSpin.
	lastSpin :=  nil.
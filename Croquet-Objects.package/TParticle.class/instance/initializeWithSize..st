initialize
initializeWithSize: sz

	size := sz.
	pPosition := Vector3Array new: sz.
	pLastPosition := Vector3Array new: sz.
	pVelocity := Vector3Array new: sz.
	pAcceleration := Vector3Array new: sz.
	pLifetime := FloatArray new: sz.
	pColor := nil.
	pDeltaColor := nil.
	startColor := VectorColor r:1.0  g:1.0 b:1.0 a:0.9.
	endColor := nil. "default is to not change the color of particles over their lifetimes."
	material := TMaterial new.
	material ambientColor: startColor.
	material diffuseColor: startColor.
	material fullBright: true.

	self setPositionRangeMin:(-0.1@-0.1@-0.1) max: (0.1@0.1@0.1).
	self setVelocityRangeMin:(-1.2@6.4@-1.2) max:(1.2@9.6@1.2).
	self setAccelerationRangeMin:(0@-10@0) max:(0@-8@0).
	self setLifetimeRange: (1000 to: 1500).
	maxTime := lifetimeRange max.

	deltaTime := 0.
	billBoard := true.
	self updateVars.
	self boundsChanged.
	globalVelocity := 0@0@0.
	lastStepTime := 0.0.
	lastGlobalPosition := nil.
	attractors := OrderedCollection new.
	^self

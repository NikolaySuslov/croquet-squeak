initialize
initialize

	| txtr tframe |
	super initialize.
	txtr := TTexture new initializeWithFileName: 'checker.png'.
	tframe := TSphere new.
	tframe radius: 2.0.
	tframe texture:txtr.
	self addChild: tframe.
	velocity := 0@0@0.
	tracer:= T3BodyTracer new.
	start := false.
	attractors := OrderedCollection new.
	stepRemainder := 0.
	speed:= 1.0.


initialize
initialize

	super initialize.
	corner := #topRight. "default corner"
	self material color:(VectorColor r:1 g:1 b:1 a:0.99).
	self material fullBright: true.
	self checkAlpha.
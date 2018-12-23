initialize
initialize
	super initialize.
	location := Vector3 x: 0.0 y:0.0 z:0.0.
	extent := Point x: 1 y: 1. " x-y extent of the rect."
	self flip: false.
	norm := 0@0@1.
	aspectFixed := false.
	aspect := 1.0.
	divisions := 1@1.
	self initBounds.
	self materialList: {TMaterial new}.
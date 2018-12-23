initialize
initialize
	super initialize.
	extent := Vector3 x: 1.0 y: 1.0 z: 1.0.
	location := Vector3 x: 0.0 y:0.0 z:0.0.
	self initBounds.
	self materialList: {TMaterial new}.

initialize
initialize
	super initialize.
	mode := GLTriangleStrip.
	
	boundSphere := TBoundSphere localPosition: (Vector3 new x:0.0 y:0.0 z:0.0) radius: 1.0.
	boundSphere frame: self.
	segments := 10.
	self materialList: {TMaterial new}.
initialize
initialize
	super initialize.
	mode := GLTriangles.
	vertexBuffer := Vector3Array ofSize: 3.
	normalBuffer := Vector3Array ofSize: 3.
	texCoordBuffer := Vector2Array ofSize: 3.
	texCoordBuffer 
		at: 1 put: (Vector2 u: 0.0 v: 1.0);
		at: 2 put: (Vector2 u: 0.0 v: 0.0);
		at: 3 put: (Vector2 u: 1.0 v: 0.0).		
	self faceGroups: {1. #(0 1 2) asIntegerArray}.
	self materialList: {TMaterial new}.
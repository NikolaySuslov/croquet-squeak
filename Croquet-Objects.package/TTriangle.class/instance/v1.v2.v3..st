render
v1: v1 v2: v2 v3: v3
	| normal |
	normal := (v3-v2 cross: v1-v2) normalized.
	normalBuffer atAllPut: normal.
	vertexBuffer
			at: 1 put: v1;
			at: 2 put: v2;
			at: 3 put: v3.
	self boundsChanged
render
pick: pointer
	^ pointer 
		pickTriangle: normalBuffer first 
		tri: vertexBuffer first 
		tri: vertexBuffer second 
		tri: vertexBuffer third.
	
		

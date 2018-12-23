instance creation
triMeshWithVertices: v alias: a norms: n textureUV: tuv faceGroups: fg material: ml 
	
	^ super new 
			initializeWithVertices: v 
			alias: a 
			norms: n 
			textureUV: tuv 
			faceGroups: fg 
			material: ml 
			mode: GLTriangles 


	
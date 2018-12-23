instance creation
initializeWithVertices: v alias: a norms: n textureUV: tuv faceGroups: fg material: ml 

	"self deprecatedExplanation: 'Use #triMeshWithVertices:... or #quadMeshWithVertices:...'."
	^ self 
		triMeshWithVertices: v 
		alias: a 
		norms: n 
		textureUV: tuv 
		faceGroups: fg 
		material: ml 
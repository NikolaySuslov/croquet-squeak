initialize
initializeWithVertices: v alias: a norms: n textureUV: tuv faceGroups: fg material: ml mode: md 
	"Basically ignores the superclass implementation, since #update recomputes geometry."
	super 
		initializeWithVertices: v 
		alias: a 
		norms: n 
		textureUV: tuv 
		faceGroups: fg 
		material: ml 
		mode: md..
	self updateMesh.
	
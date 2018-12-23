as yet unclassified
loadNewFish
	| mesh tMesh mat |
	mesh := (FileStream readOnlyFileNamed:(FileDirectory pathFromURI: 'Content/Underwater/fish.mesh')) fileInObjectAndCode.
	mat := TMaterial new.
	mat ambientColor: #(1 1 1 1).
	mat diffuseColor: #(1 1 1 1).
	tMesh := TMesh 
				initializeWithVertices: mesh vertices 
				alias: nil 
				norms: mesh vertexNormals
				textureUV: mesh texCoords
				faceGroups: {1. mesh zeroBasedFaceGroup}
				material: mat.
	tMesh initBounds.
	^tMesh
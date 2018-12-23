parsing
buildMesh: vertices faces: faces normals: vtxNormals textureUV: vtxTexCoords textureMap: txtr
	| mat mesh |
	vertices ifNil:[^nil].
	faces ifNil:[^nil].
	vertices size < 3 ifTrue:[^nil].
	faces size < 1 ifTrue:[^nil].
	mat := TMaterial new.
	mat ambientColor: #(0.9 0.9 0.9 1).
	mat diffuseColor: #(0.9 0.9 0.9 1).
	txtr ifNotNil:[
		mat texture: txtr.
		mat textureMode: GLModulate.
	].

	vertices *= self scaleFactor.
	mesh := TMesh 
				triMeshWithVertices: vertices
				alias: nil 
				norms: vtxNormals 
				textureUV: vtxTexCoords
				faceGroups: {1. faces} 
				material: mat.
	^mesh
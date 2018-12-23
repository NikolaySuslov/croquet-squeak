meshing
buildMesh
	| faceGroups materialList vertexBuffer normalBuffer texCoordBuffer index selectedFaces sz count indexBuffer |
	sz := faces size * 3.
	vertexBuffer := Vector3Array ofSize: sz.
	normalBuffer := Vector3Array ofSize: sz.
	texCoordBuffer := Vector2Array ofSize: sz.
	faceGroups := OrderedCollection new.
	materialList := OrderedCollection new.

	count := 0.
	materials keysAndValuesDo: [:matName :mat |
		materialList add: mat.
		faceGroups add: materialList size.

		selectedFaces := faces select: [:face | face materialName = matName].
		indexBuffer := IntegerArray ofSize: selectedFaces size * 3.

		selectedFaces withIndexDo: [:face :i |
			1 to: 3 do: [:j |
				index := ((i-1) * 3 + j).
				vertexBuffer at: count + index put: (vertices at: (face vertexIndices at: j)) * scale.
				normalBuffer at: count + index put: (normals at: (face normalIndices at: j)).

				face textureUVIndices isEmpty ifFalse: [
					texCoordBuffer at: count + index put: (textureUV at: (face textureUVIndices at: j)).
				].
				indexBuffer at: index put: count + index - 1.
			].
		].
		count := count + indexBuffer size.
		faceGroups add: indexBuffer.
	].

	^ TMesh 
		triMeshWithVertices: vertexBuffer
		alias: nil
		norms: normalBuffer
		textureUV: texCoordBuffer
		faceGroups: faceGroups
		material: (TMaterial new subMaterialList: materialList).
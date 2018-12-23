instance creation
newWithMaterial: aTMaterial

	| faces normals n texCoords |
	faces :=
		{
			1.	#(0 1 2 3) asIntegerArray.
			1.	#(4 5 6 7) asIntegerArray.
			1.	#(8 9 10 11) asIntegerArray.
			1.	#(12 13 14 15) asIntegerArray.
			1.	#(16 17 18 19) asIntegerArray.
			1.	#(20 21 22 23) asIntegerArray.
		}.

	normals := Vector3Array new: 24.
	n := 0@0@1.
	1 to: 4 do: [:i | normals at: i put: n].
	n := 0@0@-1.
	5 to: 8 do: [:i | normals at: i put: n].
	n := 1@0@0.
	9 to: 12 do: [:i | normals at: i put: n].
	n := -1@0@0.
	13 to: 16 do: [:i | normals at: i put: n].
	n := 0@1@0.
	17 to: 20 do: [:i | normals at: i put: n].
	n := 0@-1@0.
	21 to: 24 do: [:i | normals at: i put: n].

	texCoords := Vector2Array new: 24.
	1 to: 21 by: 4 do: [:i | texCoords at: i put: (Vector2 x: 1.0 y: 0.0)].
	2 to: 22 by: 4 do: [:i | texCoords at: i put: (Vector2 x: 0.0 y: 0.0)].
	3 to: 23 by: 4 do: [:i | texCoords at: i put: (Vector2 x: 0.0 y: 1.0)].
	4 to: 24 by: 4 do: [:i | texCoords at: i put: (Vector2 x: 1.0 y: 1.0)].

	^ self
		quadMeshWithVertices: (Vector3Array new: 24)
		alias: nil
		norms: normals
		textureUV: texCoords
		faceGroups: faces
		material: aTMaterial
			
accessing
asIndexedTriangleMesh
	"Convert the receiver into (the more compact) indexed triangle representation"
	| map faceList face vtx nrm tex mesh |
	map := Dictionary new: (faces size * 4). "Need some space for the vertices"
	faceList := WriteStream on: (Array new: faces size).
	self trianglesDo:[:tri|
		face := Array
					with: (map at: tri vertices first ifAbsentPut:[map size + 1])
					with: (map at: tri vertices second ifAbsentPut:[map size + 1])
					with: (map at: tri vertices third ifAbsentPut:[map size + 1]).
		(self isDegenerateFace: face) ifFalse:[faceList nextPut: face]].
	faceList := faceList contents.
	vtx := Vector3Array new: map size.
	nrm := Vector3Array new: map size.
	tex := Vector2Array new: map size.
	map keysAndValuesDo:[:vertex :idx|
		vtx at: idx put: vertex position.
		nrm at: idx put: vertex normal.
		tex at: idx put: vertex texCoord.
	].
	mesh := T3DTriangleMesh new.
	mesh faces: faceList.
	mesh vertices: vtx.
	mesh texCoords: tex.
	mesh vertexNormals: nrm.
	^mesh
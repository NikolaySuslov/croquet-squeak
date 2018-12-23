convert
calcVertexNormals: faceNormals

"Calculate the normal for each face vertex."
	| vertexNormals vertexCount vertexFaces fIndex vf vfn |

	"This is O(n-squared) in faces".
	faces size > 1000 ifTrue: [
		Transcript cr; show: 'Calculating vertex normals (', faces size, ' faces).'
	].

"Initialize the vertexNormals with the owning face normal."
	vertexNormals := Vector3Array  new: (vertices size).
	vertexCount := IntegerArray new: (vertices size).
	(self primCalcVertexNormals: vertexNormals vertexCount: vertexCount faces: faces faceNormals: faceNormals shadeAngleCos: shadeAngleCos)
		ifNotNil:[^vertexNormals].

	vertexFaces := Array ofSize: (vertices size).
	1 to: faces size do:[ :i |
		fIndex := (faces at:i)+1.
		(vertexFaces at: fIndex) ifNil:[vertexFaces at: fIndex put: OrderedCollection new.].
		(vertexFaces at: fIndex) add: 1 + ((i-1)//3).
	].

	1 to: vertexFaces size do:[ :i |
		vf := vertexFaces at:i.
		vf ifNotNil:[
			1 to: vf size do:[ :j |
				j+1 to: vf size do:[ :k |
					(self testNorm: (faceNormals at:(vf at:j)) norm: (faceNormals at: (vf at: k))) 
					ifTrue:[
						vertexNormals at: i put: (vertexNormals at: i)+(faceNormals at:(vf at:j)).
						vertexNormals at: i put: (vertexNormals at: i)+(faceNormals at:(vf at:j)).
						vertexCount at: i put: (vertexCount at: i)+2.
						].
					].
				].
			(vertexNormals at:i) length = 0 ifTrue:[
				1 to: vf size do:[ :m |
					vertexNormals at: i put: (vertexNormals at: i)+(faceNormals at:(vf at:m)).
					vertexCount at: i put: (vertexCount at: i)+1.
				]
			].
		].
	].
				

" Calculate the average normal and normalize."
	1 to: vertexNormals size do:[ :i |
		(vertexNormals at: i) length = 0.0 ifFalse:[
		vertexNormals at:i put: ((vertexNormals at: i)/(1.0 + (vertexCount at: i)))normalized.].].

	vfn := Vector3Array  new: (faces size).
	1 to: faces size do:[ :i |
		vfn at:i put: (vertexNormals at:(faces at:i)+1).
	].
	^ vfn.
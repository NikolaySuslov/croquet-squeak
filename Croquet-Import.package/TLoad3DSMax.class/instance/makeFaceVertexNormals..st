parse
makeFaceVertexNormals: tree
	"Extract the face Mesh:=Vertex:=Normals from the tree"

	| meshFaceVertexNormal fieldName tarray i n |

	meshFaceVertexNormal := Vector3Array new: ((tree size)//4*3).
	i := 1.
	tree linksDo:[:node |
		fieldName := node name.
		fieldName = #TMeshVertexnormal ifTrue:[
				tarray := self makeNumberArray: (node value).
				n := (Vector3 x:(tarray at: 2) y: (tarray at: 4) z:((tarray at: 3) negated)).
				n length = 0.0 ifFalse: [n:= n normalized.].
				meshFaceVertexNormal at: i put: n.
				i := i + 1.
				].
		].
	^ meshFaceVertexNormal.

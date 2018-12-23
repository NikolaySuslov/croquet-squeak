parse
makeFaceNormals: tree
	"Extract the Mesh:=Face:=Normals from the tree"
	| meshFaceNormal fieldName tarray i n |

	meshFaceNormal := Vector3Array new: ((tree size)//4).
	i := 1.
	tree linksDo:[:node |
		fieldName := node name.

		fieldName = #TMeshFacenormal ifTrue:[
				tarray := self makeNumberArray: (node value).
				n := (Vector3 x:(tarray at: 2) y: (tarray at: 4) z:((tarray at: 3) negated)).
				n length = 0.0 ifFalse: [n := n normalized.].
				meshFaceNormal at: i put:  n.
				i := i + 1.
				].
		].
	^ meshFaceNormal.

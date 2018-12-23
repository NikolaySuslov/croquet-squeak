initialize
vertices: verts faces: faces

	| box |
	box := TBox new.
	verts do:[:v | box growVertex:v].
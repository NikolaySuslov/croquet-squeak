initialize
vertices: verts faces: faces depth: d

	| box |
	box := TBox new.
	verts do:[:v | box growVertex:v].
	1 to: faces size by:3 do:[: findex |
		
	].
	
	
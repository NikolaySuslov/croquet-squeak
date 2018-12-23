accessing
collapse
"Forces all frames to identity transform while retaining translation, and pushes the previous transform to the frame children. This is used primarily for meshes and their supporting groups."
	| orient verts norms |

	orient := self orientation.
	(verts := self vertices) withIndexDo: [:v :ind |
		verts at: ind put: (orient localPointToGlobal: v)].
	(norms := self normals) withIndexDo: [:n :ind |
		norms at: ind put: (orient localPointToGlobal: n)].
	super collapse

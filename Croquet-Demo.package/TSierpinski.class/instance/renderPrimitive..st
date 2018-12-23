render
renderPrimitive: ogl

	| mode |
	changed
		ifTrue: [self update].
	mode := (ogl forceWire ifTrue:[GLLineStrip] ifFalse:[GLTriangles]).
	ogl glEnableClientState: GLVertexArray.
	ogl
		glVertexPointer: 3
		with: GLFloat
		with: 0
		with: vertices.
"	norm := (vertices
				at: (surface1 at: 1))
				cross: (vertices
						at: (surface1 at: 2)) normalized."
	ogl glNormal3fv: (normals at: 1);
		glDrawElements: mode
		with: sIndex - 1
		with: GLUnsignedInt
		with: surface1 - 1.
"	norm := (vertices
				at: (surface2 at: 1))
				cross: (vertices
						at: (surface2 at: 2)) normalized."
	ogl glNormal3fv: (normals at: 2);
		glDrawElements: mode
		with: sIndex - 1
		with: GLUnsignedInt
		with: surface2 - 1.
"	norm := (vertices
				at: (surface3 at: 1))
				cross: (vertices
						at: (surface3 at: 2)) normalized."
	ogl glNormal3fv: (normals at: 3);
		glDrawElements: mode
		with: sIndex - 1
		with: GLUnsignedInt
		with: surface3 - 1.
"	norm := (vertices
				at: (surface4 at: 1))
				cross: (vertices
						at: (surface4 at: 2)) normalized."
	ogl glNormal3fv: (normals at: 4);
		glDrawElements: mode
		with: sIndex - 1
		with: GLUnsignedInt
		with: surface4 - 1.
	ogl glDisableClientState: GLVertexArray.


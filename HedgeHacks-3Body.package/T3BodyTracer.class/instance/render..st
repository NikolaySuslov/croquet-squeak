render
render: ogl
	ogl glDisable: GLLighting.
	ogl glDisable: GLCullFace.
	ogl glColor3fv: #(0 0 1.0)asFloatArray.
	ogl glBegin: GLLineStrip.
	path do:[ :gp | ogl glVertex3fv: gp.].
 	ogl glEnd.
	ogl glEnable: GLLighting.
	ogl glEnable: GLCullFace.

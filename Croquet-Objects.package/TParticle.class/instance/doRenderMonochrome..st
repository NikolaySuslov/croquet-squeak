render
doRenderMonochrome: ogl
	
	doStep ifFalse:[^ self].

	material enable: ogl.

"	ogl glPointSize: 2.0. "
"	ogl	glBegin: GLPoints."
	ogl glPushMatrix.
	ogl glMultMatrixf: self globalTransform orthoNormInverse transposed.
"	ogl glLineWidth: 2.0."
	material enable: ogl.
	ogl glColor3fv: material ambientColor.
ogl glBegin: GLLines.
	1 to: size do:[:index |
		ogl	
			glVertex3fv: (pPosition at: index);
			glVertex3fv:(pLastPosition at: index).
		].
ogl glEnd.
	material disable: ogl.
	ogl glPopMatrix.

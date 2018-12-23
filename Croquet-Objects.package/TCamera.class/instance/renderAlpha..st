render
renderAlpha: ogl
	| vert origin scale sLength sAspect |

	ogl glDisable: GLCullFace.
	origin := Vector3 new.
	vert := Vector3 new.
	
	scale := 20.

	sLength := scale * length negated.
	sAspect := scale * self aspect.

	ogl glBegin: GLTriangles.

	ogl glNormal3fv: (clipPlanes at:1) negated.
	ogl glVertex3fv: origin.
	vert x: sAspect y: scale z: sLength.
	ogl glVertex3fv: vert.
	vert x: sAspect negated y:  scale z: sLength.
	ogl glVertex3fv: vert.

	ogl glNormal3fv: (clipPlanes at:2) negated.
	ogl glVertex3fv: origin.
	vert x: sAspect negated y:  scale negated z: sLength.
	ogl glVertex3fv: vert.
	vert x: sAspect y: scale negated z: sLength.
	ogl glVertex3fv: vert.

	ogl glNormal3fv: (clipPlanes at:3) negated.
	ogl glVertex3fv: origin.
	vert x: sAspect y: scale negated z: sLength.
	ogl glVertex3fv: vert.
	vert x: sAspect y:  scale z: sLength.
	ogl glVertex3fv: vert.

	ogl glNormal3fv: (clipPlanes at:4) negated.
	ogl glVertex3fv: origin.
	vert x: sAspect negated y:  scale z: sLength.
	ogl glVertex3fv: vert.
	vert x: sAspect negated y: scale negated z: sLength.
	ogl glVertex3fv: vert.
	ogl glEnd.

	ogl setCull.



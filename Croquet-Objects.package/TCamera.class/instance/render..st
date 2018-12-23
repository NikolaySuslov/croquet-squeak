render
render: ogl
	| vert origin scale sLength sAspect |

"This is deprecated code for sure, as there is no longer any way for a camera to render itself, but you never know if you will need to be able to visualize the viewport of a camera and this does just that."

	ogl glDisable: GLCullFace.
	origin := Vector3 new.
	vert := Vector3 new.

	scale := 1.

	sLength := scale * length negated.
	sAspect := scale * self aspect.

	ogl glBegin: GLTriangles.

	ogl glNormal3fv: ((clipPlanes at:1) negated).
	ogl glVertex3fv: origin.
	vert x: sAspect y: scale z: sLength.
	ogl glVertex3fv: vert.
	vert x: sAspect negated y:  scale z: sLength.
	ogl glVertex3fv: vert.

	ogl glNormal3fv: ((clipPlanes at:2) negated).
	ogl glVertex3fv: origin.
	vert x: sAspect negated y:  scale negated z: sLength.
	ogl glVertex3fv: vert.
	vert x: sAspect y: scale negated z: sLength.
	ogl glVertex3fv: vert.

	ogl glNormal3fv: ((clipPlanes at:3) negated).
	ogl glVertex3fv: origin.
	vert x: sAspect y: scale negated z: sLength.
	ogl glVertex3fv: vert.
	vert x: sAspect y:  scale z: sLength.
	ogl glVertex3fv: vert.

	ogl glNormal3fv: ((clipPlanes at:4) negated).
	ogl glVertex3fv: origin.
	vert x: sAspect negated y:  scale z: sLength.
	ogl glVertex3fv: vert.
	vert x: sAspect negated y: scale negated z: sLength.
	ogl glVertex3fv: vert.
	ogl glEnd.

	ogl setCull.
	texture ifNotNil:[
		texture enable: ogl.
		ogl glBegin: GLQuads;
				glNormal3f: 0.0 with: 0.0 with: -1.0;
				glTexCoord2f:0.0 with: 0.0;	
				glVertex3f: sAspect negated with: scale with: sLength;
				glTexCoord2f:1.0 with:0.0;	
				glVertex3f: sAspect with: scale with: sLength;
				glTexCoord2f:1.0 with:1.0;	
				glVertex3f: sAspect with: scale negated with: sLength;
				glTexCoord2f:0.0 with:1.0;	
				glVertex3f: sAspect negated with: scale negated with:sLength;
			 glEnd.
		texture disable: ogl.].




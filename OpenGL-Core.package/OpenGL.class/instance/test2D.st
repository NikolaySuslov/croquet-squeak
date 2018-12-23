private
test2D

| s |

true ifTrue:[
	s := 10.
	self glMatrixMode: GLModelview.
	self glLoadIdentity.
	self glDisable: GLDepthTest.
	self glTranslated: 0 with: 0 with: -1.0.
	self glEnable: GLBlend.
	self glBlendFunc: GLSrcAlpha with: GLOneMinusSrcAlpha.
	self glColor4f: 0 with: 0 with: 0 with: 1.
	self
		glBegin: GLQuads;
			glVertex2f: 0.0 with: 0.0;
			glVertex2f: 0.0 with: s;
			glVertex2f: s with: s;
			glVertex2f: s with: 0.0;
		glEnd.
	self 
		glEnable: GLBlend;
		glBlendFunc: GLSrcAlpha with: GLOneMinusSrcAlpha;
		glColor4f: 0.0 with: 0.0 with: 0.0 with: 0.5;
		glLineWidth: 1;
		glBegin: GLLineLoop;
			glVertex2f: 0 with: s;
			glVertex2f: 0 with: 0;
			glVertex2f: s with: s;
			glVertex2f:s with: 0;
		glEnd;
		glColor4f: 1.0 with: 1.0 with: 1.0 with: 0.5;
		glBegin: GLQuads;
			glVertex2f: 0 + 0.1 with: s - 0.1;
			glVertex2f: 0 + 0.1 with: 0 + 0.1;
			glVertex2f: s - 0.1 with: 0 + 0.1;
			glVertex2f: s - 0.1 with: s - 0.1;
		glEnd;
		glDisable: GLBlend.
].

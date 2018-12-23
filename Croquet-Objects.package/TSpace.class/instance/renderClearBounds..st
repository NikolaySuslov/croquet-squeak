render
renderClearBounds: ogl

"This method is used when we have a smaller overlay portal/space in on top of a full portal/space rendering. This is used for picture-in-picture displays - that is, showing a full environment on top of another one"

	| ac h v |
	ac := ogl camera.
" add the background poly, as we can't clear "
	h := ac bounds width/2.0.
	v := ac bounds height/2.0.
	ogl glDepthMask: GLFalse; " set depth buffer to not write. "
		glDisable: GLLighting;
		glColor3f: (color at: 1) with: (color at: 2) with: (color at: 3);
		glBegin: GLPolygon;
		glVertex3f:  h negated with: v with: ac zScreen negated;
		glVertex3f: h with: v with: ac zScreen negated;
		glVertex3f: h with:v negated  with: ac zScreen negated;
		glVertex3f: h negated with: v negated  with: ac zScreen negated;
		glEnd;
		glDepthMask: GLTrue; 
		glEnable: GLLighting.

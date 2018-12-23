render
renderAxes: ogl

	ogl glDisable: GLLighting;
	" This is used to render solid objects (if any). "
		glColor3fv: #(1.0 0 0)asFloatArray;
		glBegin: GLLineStrip;
    
			glVertex3fv:#(0.0 0.0 0.0)asFloatArray;
    
			glVertex3fv:#(1.0 0.0 0.0)asFloatArray;
    	
			glVertex3fv:#(0.75 0.25 0.0)asFloatArray;
    
			glVertex3fv:#(0.75 -0.25 0.0)asFloatArray;
    
			glVertex3fv:#(1.0 0.0 0.0)asFloatArray;
    
			glVertex3fv:#(0.75 0.0 0.25)asFloatArray;
    
			glVertex3fv:#(0.75 0.0 -0.25)asFloatArray;
    
			glVertex3fv:#(1.0 0.0 0.0)asFloatArray;
    
		glEnd;
    

		glColor3fv: #(0.0 1.0 0)asFloatArray;
		glBegin: GLLineStrip;
    
			glVertex3fv:#(0.0 0.0 0.0)asFloatArray;
    
			glVertex3fv:#(0.0 1.0 0.0)asFloatArray;
    
			glVertex3fv:#(0.0 0.75 0.25)asFloatArray;
    
			glVertex3fv:#(0.0 0.75 -0.25)asFloatArray;
    
			glVertex3fv:#(0.0 1.0 0.0)asFloatArray;
    
			glVertex3fv:#(0.25 0.75 0.0)asFloatArray;
    
			glVertex3fv:#(-0.25 0.75 0.0)asFloatArray;
    
			glVertex3fv:#(0.0 1.0 0.0)asFloatArray;
    
		glEnd;
    

		glColor3fv: #(0.0 0.0 1.0)asFloatArray;
		glBegin: GLLineStrip;
    
			glVertex3fv:#(0.0 0.0 0.0)asFloatArray;
    
			glVertex3fv:#(0.0 0.0 1.0)asFloatArray;
    
			glVertex3fv:#(0.25 0.0 0.75)asFloatArray;
   
			glVertex3fv:#(-0.25 0.0 0.75)asFloatArray;
    
			glVertex3fv:#(0.0 0.0 1.0)asFloatArray;
    
			glVertex3fv:#(0.0 0.25 0.75)asFloatArray;
    
			glVertex3fv:#(0.0 -0.25 0.75)asFloatArray;
    
			glVertex3fv:#(0.0 0.0 1.0)asFloatArray;
    
		glEnd;
	glEnable: GLLighting.
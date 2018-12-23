class initialization
enableOGLDefault:ogl

	| trans |
	ogl transparency = 1.0 ifTrue:[
		ogl glMaterialfv: GLFront with: GLSpecular with: OGLDefaultSpecular;
			glMaterialfv: GLFront with: GLDiffuse with: OGLDefaultDiffuse;
			glMaterialfv: GLFront with: GLAmbient with: OGLDefaultAmbient;
			glMaterialfv: GLFront with: GLEmission with: OGLDefaultEmissive;
			glMaterialf: GLFront with: GLShininess with: OGLDefaultShininess.
	]ifFalse:[
		trans := #(1 1 1 1)  asFloatArray.
		trans at: 4 put: ogl transparency.
		ogl glMaterialfv: GLFront with: GLSpecular with: OGLDefaultSpecular*trans;
			glMaterialfv: GLFront with: GLDiffuse with: OGLDefaultDiffuse*trans;
			glMaterialfv: GLFront with: GLAmbient with: OGLDefaultAmbient*trans;
			glMaterialfv: GLFront with: GLEmission with: OGLDefaultEmissive*trans;
			glMaterialf: GLFront with: GLShininess with: OGLDefaultShininess.
	].

class initialization
enableDefault:ogl

	| trans |
	ogl transparency = 1.0 ifTrue:[
		ogl glMaterialfv: GLFront with: GLSpecular with: DefaultSpecular;
			glMaterialfv: GLFront with: GLDiffuse with: DefaultDiffuse;
			glMaterialfv: GLFront with: GLAmbient with: DefaultAmbient;
			glMaterialfv: GLFront with: GLEmission with: DefaultEmissive;
			glMaterialfv: GLFront with: GLShininess with: DefaultShininess.
	]ifFalse:[
		trans := #(1 1 1 1)  asFloatArray.
		trans at: 4 put: ogl transparency.
		ogl glMaterialfv: GLFront with: GLSpecular with: DefaultSpecular*trans;
			glMaterialfv: GLFront with: GLDiffuse with: DefaultDiffuse*trans;
			glMaterialfv: GLFront with: GLAmbient with: DefaultAmbient*trans;
			glMaterialfv: GLFront with: GLEmission with: DefaultEmissive*trans;
			glMaterialfv: GLFront with: GLShininess with: DefaultShininess.
	].

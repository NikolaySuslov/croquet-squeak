render
enable: ogl index: lNum

" lNum initial value must be 1."
	| glLight |

	glLight := GLLight0 + lNum - 1.
	ogl glPushMatrix;

		glMultMatrixf: self globalTransform transposed;
		glLightfv: glLight with: GLPosition with: position.
	type = #spot ifTrue:[ 
		ogl glLightfv: glLight with: GLSpotDirection with: spotDirection;
			glLightf: glLight with: GLSpotExponent with: spotExponent;
			glLightf: glLight with: GLSpotCutoff with: spotCutoff.
		] ifFalse:[
		ogl glLightf: glLight with: GLSpotCutoff with: 180.0.
		"ogl glLightfv: glLight with: GLSpotDirection with: #(0 0 0)asFloatArray;
			glLight: glLight with: GLSpotExponent with: 0.0."
		].
	ogl glLightfv: glLight with: GLAmbient with: ambientColor;
		glLightfv: glLight with: GLDiffuse with: diffuseColor;
		glLightfv: glLight with: GLSpecular with: specularColor;
		glEnable: glLight;
		glPopMatrix.


render
enable: ogl index: lNum scaled: scale

" lNum initial value must be 1."
	| glLight |

	glLight := GLLight0 + lNum - 1.
	ogl glPushMatrix;
		glMultMatrixf: self globalTransform transposed;
		glLightfv: glLight with: GLPosition with: position;
		glLightfv: glLight with: GLAmbient with: (ambientColor*scale);
		glLightfv: glLight with: GLDiffuse with: (diffuseColor*scale);
		glLightfv: glLight with: GLSpecular with: (specularColor*scale);
		glEnable: glLight;
		glPopMatrix.


render
enable: ogl

	| trans transx hilite |

	hilite := ogl forceHilite.
	hilite ifNotNil: [
		"This is not a 'hot' code path since highlighting is a special situation,
	       so we can take enough care to create a nice appearance."
		transx := transparency * ogl transparency.
		ogl glMaterialfv: GLFront with: GLDiffuse with: ((diffuseColor+hilite)/2 alpha:transx).
		ogl glMaterialfv: GLFront with: GLAmbient with: ((ambientColor+hilite)/2 alpha:transx).
		ogl glMaterialfv: GLFront with: GLEmission with: ((diffuseColor+hilite)/2 alpha:transx).  "Glow."
		ogl glMaterialfv: GLFront with: GLSpecular with: DefaultSpecular. "No need to clear this after."
	] ifNil: [
		fullBright ifTrue:[
			ogl glDisable: GLLighting.
			ogl glColor4fv: diffuseColor.
			ogl pushFog.
			"ogl glColor3fv: DefaultWhite."
		] ifFalse:[
			transx := transparency * ogl transparency.
		"	ogl glPushAttrib: GLCurrentBit."
			transx = 1.0 ifTrue:[
				ogl glMaterialfv: GLFront with: GLSpecular with: specularColor;
					glMaterialfv: GLFront with: GLDiffuse with: diffuseColor;
					glMaterialfv: GLFront with: GLAmbient with: ambientColor;
					glMaterialfv: GLFront with: GLEmission with: emissiveColor;
					glMaterialf: GLFront with: GLShininess with: shininess.
			] ifFalse:[
				trans := #(1 1 1 1)  asFloatArray.
				trans at: 4 put: transx.
				ogl glMaterialfv: GLFront with: GLSpecular with: specularColor*trans;
					glMaterialfv: GLFront with: GLDiffuse with: diffuseColor*trans;
					glMaterialfv: GLFront with: GLAmbient with: ambientColor*trans;
					glMaterialfv: GLFront with: GLEmission with: emissiveColor*trans;
					glMaterialf: GLFront with: GLShininess with: shininess.
			].
		].
	].
	texture ifNotNil:[texture enable: ogl].
	cullFace ifFalse:[ ogl glDisable: GLCullFace.].
	flipFace ifTrue:[ ogl flipFace. ].
	allowWireFrame ifFalse:[
		saveWire := ogl forceWire.
		ogl forceWire: false.
	].
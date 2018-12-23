render
disable: ogl

	ogl forceHilite ifNotNil: [
		ogl glMaterialfv: GLFront with: GLAmbient with: DefaultAmbient.
		ogl glMaterialfv: GLFront with: GLDiffuse with: DefaultDiffuse.
		ogl glMaterialfv: GLFront with: GLEmission with:  DefaultEmissive.
		"(Specular was already cleared to default, by the enable: path.)"
	] ifNil: [
		fullBright ifTrue:[
			ogl glEnable: GLLighting.
			ogl popFog.
		] ifFalse:[
		"	ogl glPopAttrib."
			ogl glMaterialfv: GLFront with: GLSpecular with: DefaultSpecular.
			ogl glMaterialfv: GLFront with: GLDiffuse with: DefaultDiffuse.
			ogl glMaterialfv: GLFront with: GLAmbient with: DefaultAmbient.
			ogl glMaterialfv: GLFront with: GLEmission with:  DefaultEmissive.
			ogl glMaterialf: GLFront with: GLShininess with: DefaultShininess.
		].
	].

	texture ifNotNil:[texture disable: ogl].

	flipFace ifTrue:[ ogl flipFace.].
	ogl setCull.
	allowWireFrame ifFalse:[
		ogl forceWire: saveWire.
	].

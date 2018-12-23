initialize
oglDefault

	self ambientColor:  OGLDefaultAmbient copy.
	self diffuseColor:  OGLDefaultDiffuse copy.
	self specularColor: OGLDefaultSpecular copy.
	self emissiveColor: OGLDefaultEmissive copy.
	shininess := OGLDefaultShininess.

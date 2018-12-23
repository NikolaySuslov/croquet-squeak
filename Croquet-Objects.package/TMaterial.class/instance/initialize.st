initialize
initialize
	super initialize.	
	self ambientColor:  DefaultAmbient copy.
	self diffuseColor:  DefaultDiffuse copy.
	self specularColor: DefaultSpecular copy.
	self emissiveColor: DefaultEmissive copy.
	shininess := DefaultShininess.
	cullFace := true.
	flipFace := false.
	fullBright := false.
	visible := true.
	scale := 1.0.
	transparency := 1.0.
	allowWireFrame := true.
	^self

initialize
initialize
	"default is a directional light - if w is non-zero then it is a positional"
	super initialize.	
	position      := #(0.0 -1.0  0.0  0.0) asFloatArray.
	ambientColor  := #(1.0  1.0  1.0  1.0)  asVectorColor.
	diffuseColor  := #(1.0  1.0  1.0  1.0)  asVectorColor.
	specularColor := #(1.0  1.0  1.0  1.0)  asVectorColor.
	spotDirection := #(0.0  0.0 -1.0) asFloatArray.
	spotExponent  := 1.0.
	spotCutoff    := 22.5.
	type := #directional.
	local := false.
	^self

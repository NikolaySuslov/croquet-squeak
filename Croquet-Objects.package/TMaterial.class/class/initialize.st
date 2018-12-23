class initialization
initialize
	"TMaterial initialize"
	DefaultAmbient := #(0.5 0.5 0.5 1.0) asVectorColor.
	DefaultDiffuse := #(0.5 0.5 0.5 1.0) asVectorColor.
	DefaultSpecular := #(0.0 0.0 0.0 1.0) asVectorColor.
	DefaultEmissive :=  #(0.0 0.0 0.0 1.0) asVectorColor.
	DefaultShininess := 0.0.
	DefaultWhite := #(1 1 1)  asVectorColor.

	OGLDefaultAmbient := #(0.2 0.2 0.2 1.0) asVectorColor.
	OGLDefaultDiffuse := #(0.8 0.8 0.8 1.0) asVectorColor.
	OGLDefaultSpecular := #(0.0 0.0 0.0 1.0) asVectorColor.
	OGLDefaultEmissive :=  #(0.0 0.0 0.0 1.0) asVectorColor.
	OGLDefaultShininess := 0.0.

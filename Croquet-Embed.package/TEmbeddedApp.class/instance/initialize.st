initialize
initialize
	| pseudoSHA |
	super initialize.
	appID := TObjectID new.

	self eventMask: (EventKeyboard bitOr: (EventPointerOver bitOr: EventPointerDown)).
	onscreenRate := 100. 	"ms when visible"
	offscreenRate := 1000.	"ms when not visible"
	stepRate := -1. 			"not stepping"

	"Create a pseudo SHA used to identify the TForm"
	pseudoSHA := TFormManager generateSHA: (TObjectID for: 'TEmbeddedDisplay>>pseudoSHA').
	tform := TForm new 
		initialize: nil sha: pseudoSHA 
		form: (Form extent: 32@32 depth: 32)
		mipmap: false shrinkFit: true extension: nil. 
	tform bThumb: true.
	self setup.
	(self material)
		ambientColor: #(0.0 0.0 0.0 1.0);
		diffuseColor: #(0.0 0.0 0.0 1.0);
		emissiveColor: #(1.0 1.0 1.0 1.0);
		specularColor: #(0.0 0.0 0.0 1.0);
		yourself


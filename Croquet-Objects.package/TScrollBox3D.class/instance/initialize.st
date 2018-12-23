initialize
initialize

	| txtr |
	super initialize.

	sideScale := 10.0.
	txtr := TTexture new
				initializeWithFileName: 'box.png'
				mipmap: true
				shrinkFit: false.

	matHilite := TMaterial new.
	matHilite ambientColor: TButton hiliteColor.
	matHilite diffuseColor: TButton hiliteColor.
"	matHilite cullFace: false."
	matHilite texture: txtr.
	matHilite allowWireFrame: false.

	matOver := TMaterial new.
	matOver ambientColor: TButton overColor.
	matOver diffuseColor: TButton overColor.
"	matOver cullFace: false."
	matOver texture: txtr.
	matOver allowWireFrame: false.

	matDown := TMaterial new.
	matDown ambientColor: TButton downColor.
	matDown diffuseColor: TButton downColor.
"	matDown cullFace: false."
	matDown texture: txtr.
	matDown allowWireFrame: false.

	matNorm := TMaterial new.
	matNorm ambientColor: TButton normColor.
	matNorm diffuseColor: TButton normColor.
"	matNorm cullFace: false."
	matNorm texture: txtr.
	matNorm allowWireFrame: false.
	
	deferScale := false.
	self makeSides.
	changed := true.

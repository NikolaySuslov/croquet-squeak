initialize
initialize
	super initialize.
	self createWindowFrame.
	isBrowser := false.
	tinyCube := TCube new.
	tinyCube extentX: 0.1 y: 0.1 z: 0.1.
	tinyCube visible: false.
	self addChild: windowFrame.
	self addChild: tinyCube.
	matNorm := TMaterial new.
	matNorm ambientColor: #(0.5 0.7 0.7 0.5).
	matNorm diffuseColor: #(0.5 0.7 0.7 0.5).
	windowFrame material: matNorm.

	matOver := TMaterial new.
	matOver ambientColor: #(0.2 0.5 1.0 0.8).
	matOver diffuseColor: #(0.2 0.5 1.0 0.8).

	matDown := TMaterial new.
	matDown ambientColor: #(0.2 1.0 0.5 0.8).
	matDown diffuseColor: #(0.2 1.0 0.5 0.8).

	matTiny := TMaterial new.
	matTiny ambientColor: #(1.0 1.0 0.2 1.0).
	matTiny diffuseColor: #(1.0 1.0 0.2 1.0).
	tinyCube material: matTiny.

	alpha := 0.
	dalpha := 1.

	matRectNorm := TMaterial new.
	matRectNorm ambientColor: #(0.8 0.8 0.8 0.5).
	matRectNorm diffuseColor: #(0.8 0.8 0.8 0.5).

	matRectOver := TMaterial new.
	matRectOver ambientColor: #(1.0 1.0 1.0 0.8).
	matRectOver diffuseColor: #(1.0 1.0 1.0 0.8).

	matRectDown := TMaterial new.
	matRectDown ambientColor: #(1.0 1.0 1.0 0.9).
	matRectDown diffuseColor: #(1.0 1.0 1.0 0.9).
	matRectDown emissiveColor: #(1.0 1.0 1.0 1.0).

	rectFront := TRectangle new.
	rectFront extent: windowFrame extent asPoint.
	rectFront location: (Vector3 x:0.0 y:0.0 z: windowFrame radius).
	rectFront material: matRectNorm.

	rectFront objectName:'rectFront'.
	self addChild: rectFront.

	rectBack := TRectangle new.
	rectBack extent: windowFrame extent asPoint.
	rectBack location: (Vector3 x:0.0 y:0.0 z: windowFrame radius negated).
	rectBack flip: true.
	rectBack material: matRectNorm.
	rectBack objectName: 'rectBack'.
	self addChild: rectBack.
	
	windowFrame frameOn: true.
	self createWindowButtons.
	self addChild: windowButtons.
	contentsOn := false.
	contents3D := false.
	stepping := false.
	eventNum := nil.
	^self

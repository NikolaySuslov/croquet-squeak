initialize
initialize
	| matTiny |

	super initialize.
	spin := 0.
	stepping := false.
	self initMaterial.

	matTiny := TMaterial new.
	matTiny ambientColor: #(1.0 1.0 0.2 1.0) .
	matTiny diffuseColor: #(1.0 1.0 0.2 1.0).

	tinyCube := TCube new.
	tinyCube extentX: 0.05 y: 0.05 z: 0.05.
	tinyCube visible: false.
	tinyCube material: matTiny.
	self addChild: tinyCube.
	^self

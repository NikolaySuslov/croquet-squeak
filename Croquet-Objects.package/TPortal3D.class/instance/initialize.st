initialize
initialize

	| txtr mat |
	super initialize.
	inPortal := false.
	cube := TCube new.
"	self addChild: cube."
	cube solid: false.
	txtr := TTexture
				new initializeWithFileName: 'box.png'
				mipmap: true
				shrinkFit: false.

	mat := TMaterial new.
	mat ambientColor: #(0.5 0.7 0.7 0.1).
	mat diffuseColor: #(0.5 0.7 0.7 0.1).
	mat cullFace: false.
	cube material: mat.
	cube texture: txtr.
	scale := 0.1. "0.05."
	self objectName:'Portal3D'.
	boundsChanged := true.
	transform := Matrix4x4 identity.
	self extent:(Vector3 x:4 y:4 z:4).
	blocked := false.
	^self

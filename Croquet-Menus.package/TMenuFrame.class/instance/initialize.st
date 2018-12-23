initialize
initialize
	| mat |
	super initialize.
	menuStyle := TMenuStyle new.
	selectedItem := nil.
	menuItems := #().
	alignment := #topCenter.
	focused := false.
	labelFrame := TCube new.
	labelFrame extentX: 1 y: 0.1 z: 0.1.
	mat := TMaterial new.
	mat ambientColor:Color white asVectorColor.
	mat diffuseColor:Color white asVectorColor.
	mat fullBright: true.
	labelFrame material: mat.
	self addChild: labelFrame.

	menuForm := TForm new.
	menuForm initialize: nil form: (Form extent: 128@128 depth: 32) fillWhite
		mipmap: true shrinkFit: true extension: nil.
	menuTxtr := TTexture new.
	menuTxtr initializeWithTForm: menuForm.
	menuTxtr material: mat.
	menuTxtr translationX: 0.0 y: 0.1 z: 0.0.

	self addChild: menuTxtr.
	self eventMask: EventPointerDown + EventPointerOver.

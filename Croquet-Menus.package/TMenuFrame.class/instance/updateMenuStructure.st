updating
updateMenuStructure
	"Menu structure has changed; update it"
	| itemFont menuWidth itemWidth menuHeight  delta |
	menuForm ifNotNil:[^nil]. "already up to date"
	itemFont := self menuItemFont.
	menuHeight := (itemFont height + 3) * menuItems size + 3.
	menuWidth := "menuLabel labelWidth max:" 40.
	menuItems do:[:each|
		itemWidth := (itemFont widthOfString: each label) + 40.
		menuWidth := menuWidth max: itemWidth.
	].
	menuFormExtent := (menuWidth@menuHeight) truncated.
	menuForm := TForm new.
	menuForm initialize: nil form: (Form extent: menuFormExtent asLargerPowerOfTwo depth: 32)
		mipmap: true shrinkFit: true extension: nil.
	menuTxtr initializeWithTForm: menuForm.
	menuTxtr aspect: menuFormExtent y / menuFormExtent x asFloat.
	menuTxtr extent: menuFormExtent * 0.01.
	menuTxtr uvScale: (menuFormExtent / menuFormExtent asLargerPowerOfTwo) asFloatPoint.
	"@@@@ ARGH!!! This is evil: Rectangle>>center truncates to whole pixels and therefore:
		(0@0 extent: 1@1) center => 0@0
	which would completely blow the following computation so scale it by 1000."
	delta := ((0@0 extent: menuTxtr extent * 1000.0) perform: alignment) / 1000.0.
	delta := delta -  (menuTxtr extent * 0.5).
	delta := (0.0 - delta x) @ (delta y).
	menuTxtr translationX: delta x y: delta y z: 0.0.
	labelFrame translationX: delta x y: delta y + (menuTxtr extent y * 0.5) z: 0.0.
	labelFrame extentX: menuTxtr extent x+0.1.
	self redraw.
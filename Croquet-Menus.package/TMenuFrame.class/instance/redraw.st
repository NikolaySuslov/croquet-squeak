updating
redraw
	"Redraw the menu"
	| canvas x y font textColor itemWidth itemHeight itemBox checkMarkIcon subMenuIcon item icon baseColor pos |
	menuForm ifNil:[^nil].
	checkMarkIcon := CIconLibrary default at: #CheckMark.
	subMenuIcon := CIconLibrary default at: #SubMenu.
	canvas := CTransformCanvas on: menuForm textureForm.
	canvas fillRectangle: menuForm boundingBox color: self backgroundColor.
	font := self menuItemFont.
	itemWidth := menuFormExtent x.
	itemHeight := font height + 3.
	1 to: menuItems size do:[:i|
		item := menuItems at: i.
		itemBox := 0@(itemHeight * (i-1) + 3) extent: itemWidth@itemHeight.

		"determine text and base color"
		item == selectedItem ifTrue:[
			textColor := self selectedTextColor.
			baseColor := self selectedItemColor.
		] ifFalse:[
			textColor := self normalTextColor.
			baseColor := self normalItemColor.
		].
		item disabled ifTrue:[textColor := self disabledTextColor].

		"figure out text position"
		pos := itemBox leftCenter.
		pos := (pos x + 20) @ (pos y - (font height // 2)).

		"draw background and text"
		baseColor ifNotNil:[canvas fillRectangle: itemBox color: baseColor].
		canvas drawString: item label at: pos font: font color: textColor.

		"draw the icon"
		icon := item icon.
		item checked ifTrue:[icon := checkMarkIcon].
		icon ifNotNil:[
			x := (itemBox left + 10)  - (icon width // 2).
			y := (itemBox top + (itemBox height // 2)) - (icon height // 2).
			canvas paintImage: icon at: x@y.
		].

		item subMenu ifNotNil:[
			icon := subMenuIcon.
			icon ifNotNil:[canvas paintImage: icon 
				at: itemBox rightCenter - ((icon width + 2)@(icon height // 2))].
		].

		item separator ifTrue:[
			canvas fillRectangle: ((itemBox bottomLeft extent: itemBox width @ 1) insetBy: 4@0)
				color: self separatorColor.
		].
	].
	menuForm invalidate: menuForm boundingBox.
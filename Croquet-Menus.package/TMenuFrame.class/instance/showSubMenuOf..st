events
showSubMenuOf: item
	"Show the submenu of the given menu item"
	| index |
	frameParent ifNil:[^nil].
	subMenu := item subMenu ifNil:[^nil].
	index := menuItems indexOf: item ifAbsent:[^nil].
	subMenu parentMenu: self.
	self addChild: subMenu.
	subMenu translationX: menuTxtr extent x * 0.5 y: (index-1) * (self menuItemFont height + 3) * -0.01 z: 0.3.
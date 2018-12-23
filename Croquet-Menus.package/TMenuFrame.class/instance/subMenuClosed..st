events
subMenuClosed: aMenu
	"Notify a parent menu that the given subMenu has just closed"
	subMenu parentMenu: nil.
	subMenu == aMenu ifFalse:[^nil].
	"Deselect current selection, implicitly closing the subMenu too"
	self selectItemIndex: 0.
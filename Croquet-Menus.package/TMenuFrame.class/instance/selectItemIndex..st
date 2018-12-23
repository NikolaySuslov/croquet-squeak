events
selectItemIndex: index
	"Select the item with the given index"
	| selected |
	index = 0 
		ifTrue:[selected := nil]
		ifFalse:[selected := menuItems at: index].
	selected == selectedItem ifTrue:[^nil].
	subMenu ifNotNil:[
		subMenu parentMenu: nil.
		subMenu  close.
	].
	selectedItem := selected.
	selectedItem ifNotNil:[
		selectedItem subMenu ifNotNil:[self showSubMenuOf: selectedItem].
	].
	self redraw.
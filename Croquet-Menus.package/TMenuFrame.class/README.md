(c) 2006 Qwaq Inc. TMenuFrame is a TFrame for displaying a menu.

Instance variables:
	labelFrame	<TFrame>	The menu label (used for dragging)
	menuForm	<TForm>		The menu form (used for rendering)
	menuFormExtent	<Point>	The actual extent of the menu form (non-power-of-two)
	menuTxtr	<TTexture>	The texture displayed for the menu.
	menuItems	<Array of: TMenuItem>	The menu items.
	alignment	<Symbol>	A symbol describing how to align the the menu inside the frame.
	selectedItem	<TMenuItem | nil>	The currently selected menu item.
	subMenu	<TMenuFrame | nil>	The currently active sub menu (if any).
	parentMenu	<TMenuFrame | nil>	The parent menu if this is a submenu.
	focused 	<Boolean>	True if the pointer is over this menu.
	menuStyle	<TMenuStyle> The style attributes for the menu.
	selectedPoint <Vector3>	Dragging only.
	cameraNorm <Vector3>	Dragging only.

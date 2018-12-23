events
pointerLeave: evt
	focused := false.
	subMenu ifNil:[^self selectItemIndex: 0].
	"If an active submenu exists the pointer might enter the submenu. 
	We post a future message here so that if the pointer goes into the 
	subMenu we catch it accordingly"
	(self future: 50) closeMenuUnlessFocused: subMenu.
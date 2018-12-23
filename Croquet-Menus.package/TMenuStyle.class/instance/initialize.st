initialize
initialize
	super initialize.
	itemFont := Preferences standardMenuFont.
	normalItemColor := nil. "use background color"
	selectedItemColor := Color blue.
	normalTextColor := Color black.
	selectedTextColor := Color white.
	disabledTextColor := Color gray.
	separatorColor := Color blue.
	backgroundColor := Color veryLightGray.

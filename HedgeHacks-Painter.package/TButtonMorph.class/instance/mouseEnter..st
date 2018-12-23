event handling
mouseEnter: evt
	oldColor := label color.
	label color: highlightColor.
	highlightWidth ifNotNil:[
		oldWidth := self borderWidth.
		self borderWidth: highlightWidth.
	].
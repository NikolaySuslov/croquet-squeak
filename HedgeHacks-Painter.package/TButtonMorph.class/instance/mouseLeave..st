event handling
mouseLeave: evt
	label color: oldColor.
	oldWidth ifNotNil:[self borderWidth: oldWidth].
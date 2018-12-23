event handling
mouseOver: evt
	harness ifNil:[^nil].
	harness pointerXY: evt position - self bounds topLeft.

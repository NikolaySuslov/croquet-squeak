event handling
mouseUp: evt from: sketch
	| clickAction |
	clickAction := sketch valueOfProperty: #clickAction.
	clickAction ifNil:[^self].
	self mouseLeave: evt.
	clickAction value.

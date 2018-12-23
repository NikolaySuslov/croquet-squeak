event handling
startDrag: evt from: sketch
	| dragAction |
	dragAction := sketch valueOfProperty: #dragAction.
	dragAction ifNil:[^self].
	dragAction value.
	self mouseLeave: evt.
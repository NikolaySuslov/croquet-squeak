initialization
mouseDown: evt

	super mouseDown: evt.
	(row=1 and:[column=1])ifTrue:[^spreadSheet selectAll].
	row=1 ifTrue:[^spreadSheet selectColumn:column].
	column=1 ifTrue:[^spreadSheet selectRow:row].
	spreadSheet selectField: self.

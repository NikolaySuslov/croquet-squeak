initialization
selectColumn: cnum

	| col |
	col := OrderedCollection new.
	rows do:[:r | col add: (r at: cnum)].
	self highlightFields: col.

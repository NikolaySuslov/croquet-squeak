selected
selectedClass: s
	selectedClass := ((s=0) or: [(classes at: s) = selectedClass])ifTrue: [nil] ifFalse: [classes at: s].
	self changed: #selectedClass.
	self changed: #filteredMessages
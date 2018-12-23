selected
selectedSeverity: s
	selectedSeverity := (s = 0 ifTrue: [ nil ] ifFalse: [ s ]).
	self changed: #selectedSeverity.
	self changed: #filteredMessages
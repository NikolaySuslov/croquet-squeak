selected
selectedMessage: s
	selectedMessage := (s = selectedMessage) ifTrue: [nil] ifFalse: [s].
	self changed: #selectedMessage
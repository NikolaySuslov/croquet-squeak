menus
pauseResume
	(self pauseResumeState) ifFalse: [
		self setLabel: 'Paused'.
		pauseResumeState := true
	] ifTrue: [
		self setLabel: origLabel.
		pauseResumeState := false.
		messages addAll: self bufferedMessages.
		self bufferedMessages: OrderedCollection new.
		self changed: #classes.
		self changed: #filteredMessages
	]
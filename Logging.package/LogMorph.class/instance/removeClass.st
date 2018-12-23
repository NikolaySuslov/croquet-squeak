menus
removeClass
	selectedClass ifNotNil: [
		self removedClasses add: (selectedClass).
		messages := messages reject: [:e |
			e key = selectedClass].
		classes remove: selectedClass.
		self selectedClass: 0.
	
		self changed: #selectedClass.
		self changed: #classes.
		self changed: #selectedClasses.
		self changed: #filteredMessages
	]	
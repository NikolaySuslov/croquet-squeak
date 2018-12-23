accessing
selectedClassesAt:index put: value 
	value
		ifTrue: [selectedClasses add: index]
		ifFalse: [selectedClasses
				remove: index
				ifAbsent: []].
	self changed: #filteredMessages
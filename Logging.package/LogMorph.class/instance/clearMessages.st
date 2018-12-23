menus
clearMessages
	messages := OrderedCollection new.
	classes := OrderedCollection new.
	selectedClasses := nil.

	self changed: #selectedClass.
	self changed: #classes.	
	self changed: #selectedClasses.
	self changed: #filteredMessages
	
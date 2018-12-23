menus
clearToThisMessage
	(selectedMessage > 0) ifTrue: [
		messages := self messages copyFrom: selectedMessage to: messages size.
		"classes := messages inject: OrderedCollection new into: [:coll :msg |
					(coll includes: msg key) ifFalse: [coll add: msg key]. coll.]."
		self changed: #selectedClass.
		self changed: #classes.
		self changed: #filteredMessages
	].